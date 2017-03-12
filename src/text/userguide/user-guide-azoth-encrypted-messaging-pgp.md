---
title: Encrypted instant messaging with PGP
tags: user guide, azoth
published: 2012-06-27T22:50:33

---

<div style="text-align:right;">

*This guide is contributed by our nice Windows maintainer DJm00n.*

</div>

Some notes
----------

\
\
LeechCraft doesn't work with [Cygwin
GnuPG](http://cygwin.com/cgi-bin2/package-grep.cgi?grep=gnupg). Instead
it works with [native GnuPG build](http://www.gpg4win.org). If you
understand the difference you probably already have the right version.

Prerequisites
-------------

\
\
Later LeechCraft builds for Windows support message encryption,
particularly via XMPP (the
[XEP-0027](http://xmpp.org/extensions/xep-0027.html)). Native GnuPG
build called Gpg4win is required for this to function properly. Gpg4win
can be obtained [here](http://www.gpg4win.org).\
\
After installation you need to generate a pair of keys — public and
private (secret) ones. Your public key will be used by others to encrypt
messages addressed to you, which could be decrypted by you using the
private key. For this one can use the GNU Privacy Assistant application
from Gpg4win. After keys are generated you need to give your public key
to your chat buddies.\
\
You can also add public keys of your chat buddies using that same
program, GNU Privacy Assistant. This is needed for LeechCraft to encrypt
messages you write. Ask your buddies to send you their public keys via
any method convenient to them, from email to XMPP file transfer.\
\
After you've generated your keys and imported public keys of your
contacts, LeechCraft needs to be configured for this to work.

Configuring LeechCraft
----------------------

### Incoming messages decryption

\
\
Open LeechCraft settings: *Main Menu → Settings → Azoth*. Select account
you wish to configure and press the *PGP...* button on the right. Select
your private key in the drop-down list which will be used to encrypt
incoming messages and press *OK*. Then press *Apply* for settings to
take effect.

### Outgoing messages encryption

\
\
Each user can be assigned with a public PGP key, which will be used for
encrypting the messages for that user.\
\
For assigning a public key, you need to:

1.  Right-click the user in Azoth roster.
2.  Select *Manage PGP keys...* in the context menu.
3.  Choose the public key for the contact and press *OK*.

Using encrypted messaging
-------------------------

\
\
One can enable or disable message encryption before sending the
message.\
\
To toggle the encryption, one needs to press the *Enable encryption*
button in the chat tab's toolbar (a lock is drawn on it). After that all
your messages will be encrypted with the chosen public key for that
contact, and the other part will be able to read the messages only if it
has the corresponding private key. It's up to the other party, though,
whether to send you back encrypted or plain messages.\
\
If something goes wrong, the button won't be enabled and you'd get an
error message instead.\
\
Also, LeechCraft automatically enables sending encrypted messages if it
receives an encrypted message from the other part and a public key for
it is set.

Troubleshooting
---------------

\
\
There is an excellent page about common problems and their solutions on
the Psi IM project page
[here](http://psi-im.org/wiki/Investigating_GnuPG_Problems).