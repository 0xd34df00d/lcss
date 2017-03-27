---
title: Implementing tags (and other text) completion
tags: plugins, howto, development
published: 2011-04-13T21:15:24
parentPage: development-writing-plugins
bookOrder: 7
---

LeechCraft utility library has several classes that aid in supporting
completion for tags and basically any other text that consists of
';'-separated categories, like groups in IM or such. These classes are:
`Util::TagsLineEdit`, `Util::TagsCompleter` and `Util::CategorySelector`
(all in the namespace `LeechCraft`, of course).

Line edit
---------

\
\
The `Util::TagsLineEdit` class, which derives from `QLineEdit`,
represents a line edit widget where user may enter ';'-separated text.
Later the `Util::TagsCompleter` may be used to add the necessary
autocompletion functionality to this line edit.

Tags completer
--------------

\
\

    Util::TagsCompleter is a subclass of QCompleter and provides the completing itself.

    A Util::TagsCompleter is set on a Util::TagsLineEdit by passing that line edit to the completer's constructor. The rest would be done by the completer itself.

    By default, it uses the words for completion from the global LeechCraft tags database, but another source model may be set by calling OverrideModel method. The passed model should have as many rows as there are variants of the text (amount of tags or categories, for example), and for each row the first column (with the 0 index) should contain a QString with the corresponding text. Typically, a QStringListModel will do.

    Category selector

    Additionally, Util::CategorySelector class, which is subclassed from QWidget, represents a list of categories which can be checked and unchecked by the mouse. It is designed to work with Util::TagsLineEdit class to add a graphical representation for the list of the categories.

    A default category selector may be added to a Util::TagsLineEdit by calling to the Util::TagsLineEdit::AddSelector function. The selector uses the tags completer internally, so it should be added only after the completer is added to the line edit.

    Util::CategorySelector::SetPossibleSelections (const QStringList&) is used to set all the possible selections for a given selector, and Util::CategorySelector::SetSelections (const QStringList&) is used then to select items from the ones set with the SetPossibleSelections function.

    A custom selector may be created as a usual object, and then its signals and slots may be used to associate it with a line edit or any other suitable object. Util::CategorySelector has the selectionChanged (const QStringList& newSelection) signal which is emitted whenever the selection is changed by the user, for example, by checking or unchecking some items. The selector also has lineTextChanged (const QString&) slot which may be connected to a line edit's textChanged (const QString&) signal, and it is used to sync the changes to the line edit contents made by the user with the contents and selections in the selector.