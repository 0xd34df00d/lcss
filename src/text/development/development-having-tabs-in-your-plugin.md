---
title: Having tabs in your plugin
tags: plugins, howto, development
published: 2013-08-20T23:06:01
parentPage: development-writing-plugins
---

Plugins that can have tabs should implement the
[IHaveTabs](http://doc.leechcraft.org/core/class_i_have_tabs.html)
interface.

Tab classes concept
-------------------

\
\
Each plugin can have one ore more tabs opened at the same time, and
different tabs belonging to the same plugin could have different
semantics and meaning. For example, a single IM plugin can provide two
kinds of tabs: chat tab and service discovery tab. The different kinds
of tabs in LeechCraft are called tab classes.\
\
Tabs of different classes can have different semantics. For example,
tabs of one class could be opened by the user, while another tabs can
only be opened (spontaneously) by the plugin, while there could be only
one tab of a third class.\
\
Different tab classes may have different priorities. Priority defines
what tab should be opened when user requests to open a new tab without
specifying the exact tab class he wants. When user requests a new tab,
but doesn't specify its type (for example, just hits Ctrl+T), priorities
of two tab classes are compared: the priority of the class of the
current tab and the highest priority among all the tabs. If current
priority plus some delta is higher than maximum one, a new instance of
current tab class is opened, otherwise the tab with the highest priority
is opened. For example, if web browser tab has priority of 80, text
editor — 70 and search plugin — 60, and delta is 15, then if current tab
is web browser or search plugin, the new tab will be a web browser tab
(since 60 + 15 &lt; 80), but if the current tab is text editor's one,
then the new tab will also be a text editor (70 + 15 &gt; 80).\
\
The tab classes are described by the
[TabClassInfo](http://doc.leechcraft.org/core/struct_leech_craft_1_1_tab_class_info.html)
structure.

IHaveTabs methods
-----------------

\
\
The list of available tab classes should be returned from the
`IHaveTabs::GetTabClasses ()` method. This method should return a list
of `LeechCraft::TabClassInfo` structs.\
\
When a tab has been requested by the user, the
`IHaveTabs::TabOpenRequested (const QByteArray&)` method would be
called, passing the ID of the corresponding tab class, which is the one
of the IDs returned from `IHaveTabs::GetTabClasses ()` (the
`LeechCraft::TabClassInfo::TabClass_` member).\
\
There is also a bunch of signals that should be present in classes
implementing the `IHaveTabs` interface:\
\

-   `addNewTab(const QString& name, QWidget *widget)` adds a new tab
    containing `widget` and initially having </code>name</code> as the
    tab name.
-   `removeTab(QWidget *widget)` removes previously added tab with
    `widget`.
-   `changeTabName (QWidget *widget, const QString& newName)` changes
    the tab's name to `newName`, where `widget` is the tab's widget.
-   `changeTabIcon (QWidget *widget, const QIcon& icon)` same as the
    above, but changes the tab's icon.
-   `statusBarChanged (QWidget *widget, const QString& newText)`
    notifies LeechCraft the the status message for this tab has been
    changed to `newText`.
-   `raiseTab (QWidget *widget)` brings the tab with `widget` to
    the front.

\
\
The `widget` added by the `addNewTab` must implement `ITabWidget`.\
\
The `widget` parameter of the last five signals should be the widget
previously added by the `addNewTab` signal.

ITabWidget
----------

\
\
Widgets added by `IHaveTabs` should implement `ITabWidget` interface
(documented
[here](http://doc.leechcraft.org/core/class_i_tab_widget.html)). This
interface has following functions:\
\

-   `GetTabClassInfo ()` should return the tab class of this tab. The
    tab class should be equal to the one returned from
    `IHaveTabs::GetTabClasses ()` with the same tab class ID.
-   `ParentMultiTabs ()` should return the parent object which
    implements the `IHaveTabs` interface and manages this tab (that is,
    the instance object).
-   `Remove()` is called by LeechCraft when user requests the given tab
    to close, for example, by triggering the Close action or pressing
    the "X" button on the tab.
-   `GetToolBar ()` should return the toolbar associated with this tab
    (or `NULL` if there is no toolbar). The toolbar is only visible when
    the tab is active.
-   `GetTabBarContextMenuAction ()` returns the list of actions which
    would appear in the context menu of this tab. The default
    implementation returns an empty list.
-   `GetWindowMenus ()` returns a map of lists of actions to be inserted
    to the global menu. Refer to its documentation for more information.
-   `TabMadeCurrent ()` is called by LeechCraft to notify the tab that
    it is made current by the user. The default implementation
    does nothing.

Logical paths and tabs grouping
-------------------------------

\
\
To group tabs, logical paths are used. That way Tab++, for example,
groups the tabs from Poshuku belonging to the same domain. To use
logical paths, just set the `WidgetLogicalPath` property on your tab
widgets to a `QString` containing slash-separated hierarchical tree-like
structure and update it as necessary. LeechCraft would take care of the
rest. For example:

    widget->setProperty ("WidgetLogicalPath", "somedomain.com/Sample Web Page Title");

</pre>