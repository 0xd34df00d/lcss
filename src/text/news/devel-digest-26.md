---
title: Development digest #26
tags: 0.6.x, digest
published: 2012-06-19T19:40:07

---

This week we got a license for Intel VTune CPU profiler for
non-commercial use, so some stuff was heavily optimized. For example,
LeechCraft now starts much faster, especially if [Azoth](/plugins-azoth)
has a bunch of items in its contact list.

So, here's the changelog:

- Core: added `--list-plugins` and
  `--safe-mode` options. The former just lists the
  plugins that LeechCraft has found, and the latter starts LeechCraft
  without any of them, allowing to disable those failing.
- Core: added *Select All* and *Select None* buttons to the
  plugin manager.
- [AdvancedNotifications](/plugins-advancednotifications): added
  Urgent hint handler.
- [Azoth](/plugins-azoth): message text is stored in tab info, so it's
  recovered as well.
- Azoth: MUCs are rejoined on tab recovery.
- Azoth: added an option to alias KP\_Enter to Enter.
- Azoth: even non-chat nicknames can be dragged now from contact list.
- Azoth: multiple performance improvements.
- [Azoth AdiumStyles](/plugins-azoth-adiumstyles): support for
  *SenderColors.txt*.
- [Azoth ChatHistory](/plugins-azoth-chathistory): added a calendar
  for choosing dates.
- Azoth ChatHistory: clickable links in History.
- Azoth StandardStyles: added a bunch of standard styles by Pendruk.
- [Azoth Xoox](/plugins-azoth-xoox): severely optimized load time,
  especially with big roster.
- [LastFMScrobble](/plugins-lastfmscrobble): allow the user to choose
  the language of the info.
- [Liznoo](/plugins-liznoo): hide the dialog after second click on
  its action.
- [LMP](/plugins-lmp): added support for MPRIS.
- LMP: directory iteration now optionally supports symlinks.
- LMP: track properties for Now Playing, FS, Collection and playlist.
- LMP: EnableScrobbling setting is now respected.
- LMP: some scanning fixes, a couple of segfaults has been fixed too.
- LMP: fixed compatibility with TagLib &lt; 1.7.
- LMP: fixed some segfaults.
- [Poshuku](/plugins-poshuku): removed tooltips generation.
- Sidebar: support embeddind dock visibility actions.
- [TabSessManager](/plugins-tabsessmanager): fixed *Select All* and
  *Select None* buttons.
- TabSessManager: fixed tab close handling.
