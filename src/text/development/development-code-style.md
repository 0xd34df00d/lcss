---
title: Code style
tags: development
published: 2012-08-08T10:23:45
parentPage: development-writing-plugins
bookOrder: 2
---

Naming conventions
------------------

\
\

-   Local variables are named in `camelCase` with lower first letter.
-   Member variables are named in `CamelCase_` with upper first letter
    and an underscore in the end (stupid, I know, but that's
    the tradition).
-   Enums are named in `CamelCase` in singular form with upper
    first letter.
-   Enum members are named in `CamelCase`. Enum members are *always*
    used with corresponding enum scope qualifier (see C++11
    scoped enums).
-   Global variables aren't named at all. They shouldn't exist in
    your code.
-   Try to make variables visually distinct from each other. Having
    `index1` and `indexl` near each other isn't a good idea.
-   Member functions that aren't invokable (aren't Qt signals nor slots)
    are named in `CamelCase` with upper first letter.
-   Invokable member functions (Qt signals and slots) are named in
    `camelCase` with lower first letter.
-   Global free functions are also named in `CamelCase` with upper
    first letter.
-   Local free functions are named in `CamelCase` with upper
    first letter. If possible, they should be in their own
    anonymous namespace.
-   File name should be like the class's name all in lower case.
-   There are generally two files per class: header file and
    source (implementation) file.

`#include` order
----------------

\
\

1.  If it's implementation file, the corresponding header file.
2.  Standard C++/STL headers like `iostream` or `functional`. Prefer C++
    headers (say, `cmath`) over C-style ones (`math.h`).
3.  Boost headers.
4.  Qt headers.
5.  Any other library headers.
6.  LeechCraft headers.
7.  Your own files.

Variable declarations, function declarations and general things
---------------------------------------------------------------

\
\

-   Initialize each variable when declaring it, even if it's going to be
    assigned few lines later anyway.
-   Declare each variable on a separate line.
-   Attach star to the variable name (the only exception is return type
    declaration in function declaration/definition):

        void* f (int *a)
        {
            int *b = 0;
            int *c = *a;
            return b;
        }

-   & meaning reference is attached to the type:

        void g (const T& t, U& u);

-   Types should be mentioned with full namespace in the signals/slots
    declarations and `QObject::connect()` calls since `moc` doesn't
    parse them well otherwise.
-   Never, never ever put `using`-declarations in your headers.
-   Put your code in `LeechCraft::YourPlugin` namespace.
-   Put your implementation code in `.cpp`-file in
    `LeechCraft::YourPlugin` namespace as well or prefix each function.
    Avoid `using`-directives since `lupdate` tool doesn't handle them
    and you'll end up with untranslated strings.
-   All the private variables and definitions like `Q_OBJECT` or
    `Q_INTERFACES` follows immediately after beginning of the
    class definition.
-   Don't put variable names in function declarations unless you plan to
    `doxygen` it.
-   Braces are always on new line and are the only character there.

Identation and line breaks
--------------------------

\
\

-   Use tabs to ident code. Set your tab width to 4 spaces, and in case
    of vim:

        :set shiftwidth=4
        :set softtabstop=4
        :set tabstop=4

-   Breaking inside function parameter list adds two tab levels.

        int func (int a, int b,
                int c);

-   Breaking an incomplete expression adds a tab level. Breaking inside
    each parenthesis pair adds one more tab level. Binary operators are
    in the end of the line, the `->` operator also stays on the same
    line, only the `.` (dot) operator goes to the next line.
-   It is OK to make long lines in case you break them at about
    72 column.

Whitespaces
-----------

\
\

-   Unary operators are glued to their operands.

        ++a;

-   Binary operators are surrounded by whitespaces from both sides.

        c = a + b;
        ++a && !c;

-   Parenthesis are surrounded by whitespaces only from the outer side
    and only if the other symbol isn't a brace.

        ((a && b) || (c + !d) && e)

-   The only exception from the previous rule is the case when
    parenthesis are followed by a `.` or `->` operator or semicolon.

        int a = f ();
        a = f () + g ();
        a += GetPointer ()->h ();
        a -= GetReference ().DoStuff ();

Examples
--------

\
\
So, an example header file would be like:

    #pragma once

    #include 

    namespace LeechCraft
    {
    struct Entity;

    namespace YourCode
    {
        class SomeClass : public QObject
        {
            Q_OBJECT
        public:
            SomeClass (QObject* = 0);

            int Get42 () const;
        public slots:
            void handle42Changed (int);
        signals:
            void gotEntity (const LeechCraft::Entity&);
        }
    }
    }

</pre>
\
\
The corresponding source file would be:

    #include "someclass.h"
    #include 
    #include 
    #include 
    #include 
    #include 
    #include "core.h"

    namespace LeechCraft
    {
    namespace YourCode
    {
        namespace
        {
            int func (int a, MyClass *f)
            {
                int result = f->GetID () +
                        SomeAnotherLongFunctionYouWillDefinitelyWantToWrap (a);
                result *= Core::Instance ().GetSomeCalculator ()->
                        Initialize ().GetFactor ();
                result /= Core::Instance ()
                        .AnotherReaaaallyLongFunction (result, a);
                if ((result == 42 &&
                            !a) ||
                        a == 42)
                    std::cout << "Truth is out there" << std::endl;
                return result;
            }
        }

        SomeClass::SomeClass (QObject *parent)
        : QObject (parent)
        {
        }

        int SomeClass::Get42 ()
        {
            return 42;
        }

        void SomeClass::handle42Changed (int newNum)
        {
            if (newNum != 42)
                throw std::runtime_error ("WTF? 42 isn't 42!");

            emit gotEntity (Entity ());
        }
    }
    }

</pre>
Language
--------

\
\

-   Use STL, it's cool.
-   Use Boost, it's cool.
-   Use exceptions, they're cool.
-   Don't reinvent the wheel, it's not cool.
-   Don't use preprocessor for anything other than include guards and
    Boost.PP black magic.
-   Prefer `#pragma once` over include guards.
-   Prefer C++11 lambdas over free functors/functions.
-   Prefer `qobject_cast` over `dynamic_cast`.
-   Prefer forward declarations to reduce compile time.
-   Pass objects by const reference wherever possible. That would speed
    up things and may reduce compile time since there would be more
    candidates for forward declaration.
-   Put member functions implementations in `.cpp`-file to reduce
    compile time.
-   Use `std::shared_ptr`. Except the obvious memory bookkeeping reason,
    one more is that `shared_ptr` allows the corresponding type to be
    known only on instantiation which usually happens in source file.
    This way you get one more chance to forward-declare the type in the
    header, further reducing compile time.
-   Use `std::unique_ptr`.
-   Consider Pimpl idiom. It can speed compilation a lot.
-   Forget about `malloc` and `free`. Use `new` and `delete` instead.
-   Resource acquisition is initialization, don't forget about it. You
    can once again use `std::shared_ptr` or `std::unique_ptr` with a
    custom deleter to call an arbitrary function when control gets out
    of scope, be it a database disconnect, call to
    `QSettings::endGroup()` after `beginGroup()` or whatever.

Example IDE settings
--------------------

\
\
KDevelop is the IDE of choice for LeechCraft. It's a sophisticated IDE,
supporting CMake projects, having awesome autocomplete features that can
even handle Boost-rich code, and KDevelop 4.3 would also support
features like lambdas, `auto`{type="cpp"}s and variadic templates from
C++11 when released.\
\
The following settings make autoformatting the most close the LC's
codestyle.\
\
First, we make a custom codestyle in KDevelop's settings: ![Custom code
style](http://files.leechcraft.org/kdevelop_code1.png) Please note the
*Add Kate Modeline* checkbox on this screenshot.\
\
The custom style's settings should be something like this: ![Custom code
style settings](http://files.leechcraft.org/kdevelop_code2.png) ![Custom
code style settings](http://files.leechcraft.org/kdevelop_code3.png)
