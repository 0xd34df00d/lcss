---
title: Azoth Xoox
tags: xoox, azoth
shortdescr: XMPP protocol implementation
parentPage: plugins-azoth
---

Azoth Xoox provides support for the XMPP protocol in Azoth.\
\
Xoox is based on the [QXmpp](https://github.com/qxmpp-project/qxmpp)
library.

### Feature highlights

\
\

-   Media calls support (Jingle).
-   Support for PEP and current user activity, mood, tune and location.
-   Bookmarks with autojoin support.
-   Full support for MUCs.
-   Support for messages with HTML content.
-   Notifications about chat state participation.
-   Service discovery support.
-   Gateway support, with registration.
-   Support for various file transfer methods.
-   In-band registration of accounts (right from the client).
-   Privacy lists.
-   Encrypted and signed messages and presences.
-   Full CAPTCHA support.
-   Support for ad-hoc commands.
-   Support for exchanging roster items.
-   Search for contacts in Jabber.

### XEPs matrix

\
\
This table summarizes the status of different XEPs in Azoth Xoox.\
\

<style type="text/css">
.xepm, .xepm tr, .xepm td { border:1px solid #000; }
.splan { background-color: #FF5858; }
.sinprog { background-color: #FFE958; }
.sdone { background-color: #2ED52E; }
</style>
\
\

| XEP                                                                                     |Notes                                                                              |
|-----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| [XEP-0004](http://xmpp.org/extensions/xep-0004.html): Data Forms                        |                                                                                   |
| [XEP-0012](http://xmpp.org/extensions/xep-0012.html): Last Activity                     |                                                                                   |
| [XEP-0016](http://xmpp.org/extensions/xep-0016.html): Privacy Lists                     |                                                                                   |
| [XEP-0027](http://xmpp.org/extensions/xep-0027.html): Current Jabber OpenPGP Usage      |                                                                                   |
| [XEP-0030](http://xmpp.org/extensions/xep-0030.html): Service Discovery                 |                                                                                   |
| [XEP-0045](http://xmpp.org/extensions/xep-0045.html): Multi-User Chat                   |                                                                                   |
| [XEP-0047](http://xmpp.org/extensions/xep-0047.html): In-Band Bytestreams               |                                                                                   |
| [XEP-0048](http://xmpp.org/extensions/xep-0048.html): Bookmarks                         |                                                                                   |
| [XEP-0050](http://xmpp.org/extensions/xep-0050.html): Ad-Hoc Commands                   |                                                                                   |
| [XEP-0054](http://xmpp.org/extensions/xep-0054.html): vcard-temp                        |                                                                                   |
| [XEP-0055](http://xmpp.org/extensions/xep-0055.html): Jabber Search                     |                                                                                   |
| [XEP-0060](http://xmpp.org/extensions/xep-0060.html): Publish-Subscribe                 |                                                                                   |
| [XEP-0065](http://xmpp.org/extensions/xep-0065.html): SOCKS5 Bytestreams</a>            |                                                                                   |
| [XEP-0071](http://xmpp.org/extensions/xep-0071.html): XHTML-IM                          |                                                                                   |
| [XEP-0077](http://xmpp.org/extensions/xep-0077.html): In-Band Registration              |                                                                                   |
| [XEP-0078](http://xmpp.org/extensions/xep-0078.html): Non-SASL Authentication           |                                                                                   |
| [XEP-0080](http://xmpp.org/extensions/xep-0080.html): User Location                     |                                                                                   |
| [XEP-0082](http://xmpp.org/extensions/xep-0082.html): XMPP Date and Time Profiles       |                                                                                   |
| [XEP-0083](http://xmpp.org/extensions/xep-0083.html): Nested Roster Groups              |                                                                                   |
| [XEP-0084](http://xmpp.org/extensions/xep-0084.html): User Avatar                       |                                                                                   |
| [XEP-0085](http://xmpp.org/extensions/xep-0085.html): Chat State Notifications          |Clients with old entity caps XEP don't send these notifications to Azoth.          |
| [XEP-0090](http://xmpp.org/extensions/xep-0090.html): Legacy Entity Time                |                                                                                   |
| [XEP-0091](http://xmpp.org/extensions/xep-0091.html): Legacy Delayed Delivery           |                                                                                   |
| [XEP-0092](http://xmpp.org/extensions/xep-0092.html): Software Version                  |                                                                                   |
| [XEP-0095](http://xmpp.org/extensions/xep-0095.html): Stream Initiation                 |                                                                                   |
| [XEP-0096](http://xmpp.org/extensions/xep-0096.html): SI File Transfer                  |                                                                                   |
| [XEP-0100](http://xmpp.org/extensions/xep-0100.html): Gateway Interaction               |                                                                                   |
| [XEP-0106](http://xmpp.org/extensions/xep-0106.html): JID Escaping                      |                                                                                   |
| [XEP-0107](http://xmpp.org/extensions/xep-0107.html): User Mood                         |                                                                                   |
| [XEP-0108](http://xmpp.org/extensions/xep-0108.html): User Activity                     |                                                                                   |
| [XEP-0115](http://xmpp.org/extensions/xep-0115.html): Entity Capabilities               |Versions of this XEP prior to 1.4 aren't supported.                                |
| [XEP-0118](http://xmpp.org/extensions/xep-0118.html): User Tune                         |                                                                                   |
| [XEP-0122](http://xmpp.org/extensions/xep-0122.html): Data Forms Validation             |                                                                                   |
| [XEP-0126](http://xmpp.org/extensions/xep-0126.html): Invisibility                      |                                                                                   |
| [XEP-0128](http://xmpp.org/extensions/xep-0128.html): Service Discovery Extensions      |                                                                                   |
| [XEP-0136](http://xmpp.org/extensions/xep-0136.html): Message Archiving                 |                                                                                   |
| [XEP-0138](http://xmpp.org/extensions/xep-0138.html): Stream Compression                |                                                                                   |
| [XEP-0141](http://xmpp.org/extensions/xep-0141.html): Data Forms Layout                 |Allows to group data fields together.                                              |
| [XEP-0144](http://xmpp.org/extensions/xep-0144.html): Roster Item Exchange              |                                                                                   |
| [XEP-0145](http://xmpp.org/extensions/xep-0145.html): Annotations                       |Allows to add notes to contacts.                                                   |
| [XEP-0146](http://xmpp.org/extensions/xep-0146.html): Remote Controlling Clients        |Allows to control the client remotely, for example, for fetching unread messages.  |
| [XEP-0147](http://xmpp.org/extensions/xep-0147.html): XMPP URI Scheme Query Components  |                                                                                   |
| [XEP-0153](http://xmpp.org/extensions/xep-0153.html): vCard-Based Avatars               |                                                                                   |
| [XEP-0158](http://xmpp.org/extensions/xep-0158.html): CAPTCHA Forms                     |                                                                                   |
| [XEP-0163](http://xmpp.org/extensions/xep-0163.html): Personal Eventing Protocol        |                                                                                   |
| [XEP-0166](http://xmpp.org/extensions/xep-0166.html): Jingle                            |                                                                                   |
| [XEP-0167](http://xmpp.org/extensions/xep-0167.html): Jingle RTP Sessions               |                                                                                   |
| [XEP-0176](http://xmpp.org/extensions/xep-0176.html): Jingle ICE-UDP Transport Method   |                                                                                   |
| [XEP-0184](http://xmpp.org/extensions/xep-0184.html): Message Delivery Receipts         |                                                                                   |
| [XEP-0199](http://xmpp.org/extensions/xep-0199.html): XMPP Ping                         |                                                                                   |
| [XEP-0202](http://xmpp.org/extensions/xep-0202.html): Entity Time                       |                                                                                   |
| [XEP-0203](http://xmpp.org/extensions/xep-0203.html): Delayed Delivery                  |                                                                                   |
| [XEP-0221](http://xmpp.org/extensions/xep-0221.html): Data Forms Media Element          |                                                                                   |
| [XEP-0224](http://xmpp.org/extensions/xep-0224.html): Attention                         |                                                                                   |
| [XEP-0231](http://xmpp.org/extensions/xep-0231.html): Bits of Binary                    |                                                                                   |
| [XEP-0232](http://xmpp.org/extensions/xep-0232.html): Software Information              |                                                                                   |
| [XEP-0245](http://xmpp.org/extensions/xep-0245.html): The /me command                   |                                                                                   |
| [XEP-0249](http://xmpp.org/extensions/xep-0249.html): Direct MUC Invitations            |                                                                                   |
| [XEP-0277](http://xmpp.org/extensions/xep-0277.html): Microblogging over XMPP           |                                                                                   |
| [XEP-0280](http://xmpp.org/extensions/xep-280.html): Message Carbons                    |                                                                                   |
| [XEP-0313](http://xmpp.org/extensions/xep-313.html): Message Archive Management         |                                                                                   |

\
\
The colors match these statuses:

  ---------- ------------- ------
  Planning   In progress   Done
  ---------- ------------- ------
