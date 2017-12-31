---
title: LeechCraft 0.5.96 is released
tags: release, 0.6.x
published: 2013-05-24T08:42:12

---

LeechCraft 0.5.96 "Quittance" is released.

This release is the first one after the 0.5.95 feature freeze, thus it
incorporates only bug fixes:

- Core: keep tab icon along tab moves between windows.
- Core: fixed toolbar handling on tab moves between windows.
- Core: fixed file locking threading issues.
- Core: fixed network disk cache expiration handling.
- Core: proper handling of forcefully closed unassociated
  dock widgets.
- Core: don't show actions with empty text in popup menus.
- [Azoth](/plugins-azoth): fixed autoscrolling.
- Azoth: application-wide users list shortcut.
- Azoth: case-insensitive users list filtering.
- Azoth: use proper icon for voice calls.
- [Azoth Acetamide](/plugins-azoth-acetamide): made the channels list
  dialog non-modal.
- Azoth Acetamide: allow joining to channels while the list
  is fetched.
- [Azoth VB](/plugins-azoth-velvetbird): don't own conversation by the
  buddy, fixes multiple segfaults.
- Blogique: fixed progress indicator.
- Blogique Hestia: fixed autoupdating entries in local blog.
- Monocle Postrus: fixed FindLibSpectre.cmake for upcoming CMake.
- [LMP](/plugins-lmp): fix rare segfaults on queue clearing.
- LMP: clear last song data on player clearing.
- LMP: support drags from filesystem browser.
- LMP: replace queue on playlist activation.
- LMP: properly restore play mode check state.
- [Popishu](/plugins-popishu): fixed caret line background color.
