---
title: Azoth Xoox
tags: xoox, azoth
shortdescr: XMPP protocol implementation
parentPage: plugins-azoth
---

Azoth Xoox provides support for the XMPP protocol in Azoth.

Xoox is based on the [QXmpp](https://github.com/qxmpp-project/qxmpp)
library.

### Feature highlights

- Media calls support (Jingle).
- Support for PEP and current user activity, mood, tune and location.
- Bookmarks with autojoin support.
- Full support for MUCs.
- Support for messages with HTML content.
- Notifications about chat state participation.
- Service discovery support.
- Gateway support, with registration.
- Support for various file transfer methods.
- In-band registration of accounts (right from the client).
- Privacy lists.
- Encrypted and signed messages and presences.
- Full CAPTCHA support.
- Support for ad-hoc commands.
- Support for exchanging roster items.
- Search for contacts in Jabber.

### XEPs matrix

This table summarizes the status of different XEPs in Azoth Xoox.

<style type="text/css">
.xepm, .xepm tr, .xepm td { border:1px solid #000; }
.splan { background-color: #FF5858; }
.sinprog { background-color: #FFE958; }
.sdone { background-color: #2ED52E; }
</style>

<table class="xepm" style="width:85%;">
<thead>
<tr>
<th width="35%">XEP</th>
<th width="65%">Notes</th>
</tr>
</thead>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0004.html">XEP-0004</a>: Data Forms</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0012.html">XEP-0012</a>: Last Activity</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0016.html">XEP-0016</a>: Privacy Lists</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0027.html">XEP-0027</a>: Current Jabber OpenPGP Usage</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0030.html">XEP-0030</a>: Service Discovery</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0045.html">XEP-0045</a>: Multi-User Chat</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0047.html">XEP-0047</a>: In-Band Bytestreams</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0048.html">XEP-0048</a>: Bookmarks</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0050.html">XEP-0050</a>: Ad-Hoc Commands</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0054.html">XEP-0054</a>: vcard-temp</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0055.html">XEP-0055</a>: Jabber Search</td>
<td></td>
</tr>
<tr>
<td class="sinprog"><a href="http://xmpp.org/extensions/xep-0060.html">XEP-0060</a>: Publish-Subscribe</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0065.html">XEP-0065</a>: SOCKS5 Bytestreams</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0071.html">XEP-0071</a>: XHTML-IM</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0077.html">XEP-0077</a>: In-Band Registration</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0078.html">XEP-0078</a>: Non-SASL Authentication</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0080.html">XEP-0080</a>: User Location</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0082.html">XEP-0082</a>: XMPP Date and Time Profiles</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0083.html">XEP-0083</a>: Nested Roster Groups</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0084.html">XEP-0084</a>: User Avatar</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0085.html">XEP-0085</a>: Chat State Notifications</td>
<td>Clients with old entity caps XEP don't send these notifications to Azoth.</td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0090.html">XEP-0090</a>: Legacy Entity Time</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0091.html">XEP-0091</a>: Legacy Delayed Delivery</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0092.html">XEP-0092</a>: Software Version</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0095.html">XEP-0095</a>: Stream Initiation</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0096.html">XEP-0096</a>: SI File Transfer</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0100.html">XEP-0100</a>: Gateway Interaction</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0106.html">XEP-0106</a>: JID Escaping</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0107.html">XEP-0107</a>: User Mood</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0108.html">XEP-0108</a>: User Activity</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0115.html">XEP-0115</a>: Entity Capabilities</td>
<td>Versions of this XEP prior to 1.4 aren't supported.</td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0118.html">XEP-0118</a>: User Tune</td>
<td></td>
</tr>
<tr>
<td class="splan"><a href="http://xmpp.org/extensions/xep-0122.html">XEP-0122</a>: Data Forms Validation</td>
<td></td>
</tr>
<tr>
<td class="splan"><a href="http://xmpp.org/extensions/xep-0126.html">XEP-0126</a>: Invisibility</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0128.html">XEP-0128</a>: Service Discovery Extensions</td>
<td></td>
</tr>
<tr>
<td class="sinprog"><a href="http://xmpp.org/extensions/xep-0136.html">XEP-0136</a>: Message Archiving</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0138.html">XEP-0138</a>: Stream Compression</td>
<td></td>
</tr>
<tr>
<td class="splan"><a href="http://xmpp.org/extensions/xep-0141.html">XEP-0141</a>: Data Forms Layout </td>
<td>Allows to group data fields together.</td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0144.html">XEP-0144</a>: Roster Item Exchange</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0145.html">XEP-0145</a>: Annotations</td>
<td>Allows to add notes to contacts.</td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0146.html">XEP-0146</a>: Remote Controlling Clients</td>
<td>Allows to control the client remotely, for example, for fetching unread messages.</td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0147.html">XEP-0147</a>: XMPP URI Scheme Query Components</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0153.html">XEP-0153</a>: vCard-Based Avatars</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0158.html">XEP-0158</a>: CAPTCHA Forms</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0163.html">XEP-0163</a>: Personal Eventing Protocol</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0166.html">XEP-0166</a>: Jingle</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0167.html">XEP-0167</a>: Jingle RTP Sessions</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0176.html">XEP-0176</a>: Jingle ICE-UDP Transport Method</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0184.html">XEP-0184</a>: Message Delivery Receipts</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0199.html">XEP-0199</a>: XMPP Ping</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0202.html">XEP-0202</a>: Entity Time</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0203.html">XEP-0203</a>: Delayed Delivery</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0221.html">XEP-0221</a>: Data Forms Media Element</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0224.html">XEP-0224</a>: Attention</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0231.html">XEP-0231</a>: Bits of Binary</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0232.html">XEP-0232</a>: Software Information</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0245.html">XEP-0245</a>: The /me command</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-0249.html">XEP-0249</a>: Direct MUC Invitations</td>
<td></td>
</tr>
<tr>
<td class="sinprog"><a href="http://xmpp.org/extensions/xep-0277.html">XEP-0277</a>: Microblogging over XMPP</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-280.html">XEP-0280</a>: Message Carbons</td>
<td></td>
</tr>
<tr>
<td class="sdone"><a href="http://xmpp.org/extensions/xep-313.html">XEP-0313</a>: Message Archive Management</td>
<td></td>
</tr>
</table>
<p>The colors match these statuses:</p>
<table class="xepm" style="width: 300px;">
<tr>
<td class="splan" width="33%">Planning</td>
<td class="sinprog" width="33%">In progress</td>
<td class="sdone" width="33%">Done</td>
</tr>
</table>
