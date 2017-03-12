---
title: Writing protocol plugins for Azoth
tags: plugins, development, azoth
published: 2011-02-12T04:09:56

---

This document tries to overview basic ideas regarding implementing
protocol plugins in Azoth. Please refer to the doxygen-style
documentation in `src/plugins/azoth/interfaces/*.h`{type="bash"} for
more information.

Introduction
------------

\
\
Protocol plugins add support for various protocols to Azoth. Since this
involves the plugins for plugins concept of LeechCraft, please refer to
the [corresponding document](/development-plugins-for-plugins) if you
are unfamiliar with it.\
\
Since protocol plugins are second-level plugins, they should at least
implement `IInfo` and `IPlugin2`. For Azoth to detect them as a protocol
plugin, the return value of the `IPlugin2::GetPluginClasses()` method
should contain the
`"org.LeechCraft.Plugins.Azoth.Plugins.IProtocolPlugin"` class, and they
also need to implement the `IProtocolPlugin` interface.\
\
The basic picture is the following: `IProtocolPlugin` provides different
`IProtocol`s, each `IProtocol` has some `IAccount`s representing, well,
user's accounts, and then each `IAccount` has several `ICLEntry`
objects, that represent permament contacts, MUCs (see `IMUCEntry`
interface for MUCs), private chats, unauthorized users, and other
similar things. The `ICLEntry` objects are differed by their unique ID
(`ICLEntry::GetEntryID()`), which is basically used in all operations
regarding the entries.

IProtocolPlugin
---------------

\
\

    IProtocolPlugin returns the list of protocols via its IProtocolPlugin::GetProtocols() method. Each object in the returned list should implement the IProtocol interface.

    The protocols list provided by a IProtocolPlugin is static and can't be changed at runtime after the list of protocols has been requested from the plugin, but it can change between LeechCraft runs.

    IProtocol

    IProtocol is the interface that all protocols should implement.

    First of all, it declares some features that may or may not be supported by a protocol, see the IProtocol::GetFeatures() method. For each supported feature Azoth would automatically create the needed trigger actions.

    A IProtocol also manages accounts that belong to this protocol. When user wants to add a new account in this protocol, the IProtocol::InitiateAccountRegistration() would be called. When removal is requested, the IProtocol::RemoveAccount() would be called. In both cases, as well as account is added or removed because of some other reason, the IProtocol::accountAdded() and IProtocol::accountRemoved() signals should be emitted.

    The list of currently registered accounts is retrieved via the IProtocol::GetRegisteredAccounts() method. Each object in the returned list should implement IAccount interface.

    MUC support from the protocol part

    To allow user to join multiuser chats in your plugin, you just need to:

    Declate that MUCs are supported at all in this protocol by returning the PFSupportsMUCs from IProtocol::GetFeatures().
    Declare that MUCs can be joined by user's wish by returning the PFMUCsJoinable from IProtocol::GetFeatures().
    Return a widget implementing IMUCJoinWidget from the IProtocol::GetMUCJoinWidget() which would be used to join the MUCs.


    IAccount

    IAccount represents a single account. It also defines a set of features (see IAccount::AccountFeature enum) and provides various methods for manipulating the contact list entries present in this account. Each object in the related methods should implement ICLEntry, of course.

    An up-to-date list of contact list entries should be returned from IAccount::GetCLEntries() method. Authorization/subscription manipulation is done via Authorize() and DenyAuth() methods, and new items could be added via the RequestAuth(). Entries are removed from the contact list via the RemoveEntry() method. Whenever the list of entries changes for any reason, the gotCLItems() or removedCLItems() signals should be emitted. Signals authorizationRequested(), itemSubscribed(), itemUnsubscribed(), itemCancelledSubscription() and itemGrantedSubscription() should be emitted when corresponding subscription events are detected.

    If the account supports file transfers, it should return the FMUCsSupportFileTransfers flag from the IAccount::GetAccountFeatures() and return a proper transfer manager object, which should implement ITransferManager interface, from the GetTransferManager() method.

    ICLEntry

    ICLEntry is the basic interface for everything that may appear in the contact list — be it a persistent contact in Jabber roster, a multiuser conference, an unauthorized user, or anything. Whenever the entry changes, either as the result of our actions or as a result of roster push in XMPP, for example, the corresponding signals should be emitted: nameChanged(), groupsChanged(), avatarChanged(), depending on what has changed.

    Types

    There are several types of entries:

    ETChat for usual chats between two contacts.
    ETMUC for multi-user chatrooms, in this case the entry should also implement IMUCEntry interface (see the end of this section).
    ETPrivateChat for private chats between two participants of a MUC.
    ETUnauthEntry for representing entries that have requested authorization but haven't been denied or granted yet.


    Entry IDs

    Entries are identified by their ID string returned by ICLEntry::GetEntryID(), unique to the account. Generally a protocol-defined string (Jabber ID for XMPP, UIN for ICQ, and such) will do just fine. If there are multiple representations of a single remote contact in the contact list, they should all have a different ID string. For example, it's a good idea to append something like "_unauth" to entries representing unauthorized ones.

    Entries also have human-readable ID, which most likely would be just the protocol-defined identification string. It's ok to have several different entries in the contact list with the same human-readable ID, as long as they represent the same remote contact.

    Another difference is that human-readable ID should be really human-readable, and IDs in such format the user is most likely to enter in various dialogs like user search or user addition.

    Features

    The entry advertises its features via ICLEntry::GetEntryFeatures() method.

    The entry may be permanent (FPermanentEntry) or session-wide (FSessionEntry). For example, a contact stored on the server is a permament entry, while an ICLEntry representing a multiuser chatroom and participans in that chat room is a session-wide entry.

    If the entry can be renamed and saved in the contact list under another name, it should return the FSupportsRenames flag and perform the renames in SetEntryName() method.

    Authentication

    If the entry supports authentication manipulation (for example, an entry representing a MUC most likely won't support it), it should return FSupportsAuth flag from GetEntryFeatures() and also implement IAuthable interface, and that interface is pretty obvious.

    Variants (resources) support

    In several protocols, like XMPP, entry may have different target variants, or resources. This is reflected by the Variants() method that should return the currently available variants, in descending order of precedence. If variants concept isn't supported by the protocol, a list of single (null) string should be returned. When the list of variants changes, the availableVariantsChanged() signal should be emitted.

    Messages

    To create a message, the CreateMessage() method is used. The returned object should implement the IMessage interface and should not be sent automatically. Instead, IMessage::Send() is used to send the message at the appropriate moment. If the protocol supports variants, the message should be directed to variant passed to the method, or to the variant with the highest priority if the passed one is currently unavailable.

    When a new message is received, the gotMessage() signal should be emitted. All sent and received messages should be stored and later accessed via the GetAllMessages() method. The only exception is for MUC entries, since they are expected to have each sent out message to come back from the server (this behavior is modelled after the XMPP protocol).

    Chat participation

    For protocols and entries that support chat participation state notifications, the signal chatPartStateChanged() should be used accordingly.

    Entry/client information

    The ShowInfo() method is called when user asks to show the information about the entry. The method should show the dialog with the information about this entry.

    The GetClientInfo() method is used to obtain information about client's software and features. It returns a QMap with the following expected fields:

    "client_type" with the ID of the client software, like "psi" for the Psi IM.
    "client_name" with the human-readable name of the client software.
    "client_version" with the version string of the client.


    IMUCEntry

    The IMUCEntry interface is for entries that represent multi-user chatrooms. It advertises MUC-specific features via GetMUCFeatures(). MUC subject may be got or changed via GetMUCSubject() and SetMUCSubject(). Current participants may be obtained via the GetParticipatns(), which should return a list of objects implementing ICLEntry, and user's nick may be got or changed via GetNick() and SetNick(). One leaves the room by calling the Leave() method.

    It also provides means for changing user's roles and affiliations: MayChangeRole() and MayChangeAffiliation() are used to query whether our user may change the role and affiliation of another participant to the target value, while GetRole(), GetAffiliation(), SetRole() and SetAffiliation() are used to get and set roles and affiliations. Kicking is done by setting the role to MUCRNone, while banning is done via MUCAOutcast affiliation.

    IMessage

    The IMessage interface should be implemented by objects representing messages of different kinds: chat messages, MUC messages, statuses, etc.

    The message should only be sent out as the result of Send() call.

    Message types and subtypes

    There are five types of messages:

    MTChatMessage for standard one-to-one chat sessions, be it a usual session or a private chat in a MUC.
    MTMUCMessage for public messages in MUCs.
    MTStatusMessage for messages representing participant's status/presence changes.
    MTEventMessage for notifying about events like subject changes in MUCs, kicks, bans and such.
    MTServiceMessage for other stuff.


    There is a more precise classification of message types, please refer to the MessageSubType enum for that.

    Relevant entries

    There are basically to entries connected to each message: other entry and parent entry. The difference only appears for public messages in MUCs, since for one-to-one chats both entries are equal and represent the real other entry. For MUCs, other entry is the representation of the participant that sent the message, while parent entry is the MUC entry. OtherPart() and ParentCLEntry() are used respectively to obtain the corresponding entries.

    ITransferManager

    ITransferManager is used for entries that support file transfers (and if account supports that, of course).

    To initiate file transfer, the SendFile() method is used, which takes the entry ID, variant and the file name. If the variant is unavailable, or the protocol doesn't support variants, the variant with the highest priority should be used. SendFile() returns an object that implements ITransferJob which may be later used to watch the progress of the file transfer.

    Object implementing ITransferJob is also emitted with the fileOffered() signal to signalize incoming file transfer request. To accept the request, ITransferJob::Accept() code with the string parameter representing path to the output directory. To deny the request, or to abort an already started one, ITransferJob::Reject() is used.