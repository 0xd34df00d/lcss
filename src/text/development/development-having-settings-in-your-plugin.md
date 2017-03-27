---
title: Having settings in your plugin
tags: howto, development
published: 2014-07-16T17:31:54
parentPage: development-writing-plugins
bookOrder: 9
---

Basic description
-----------------

\
\
Having settings in your plugin boils down to implementing the
[IHaveSettings](http://doc.leechcraft.org/core/class_i_have_settings.html)
interface and writing an XML file with the description of the settings.
The XML file defines the settings that your plugin exposes to the user
via the XmlSettingsDialog (further referred as XSD) system.

C++ side
--------

### Implementing IHaveSettings

\
\
Implementing `IHaveSettings` typically consists of the following steps:

1.  creating a class that is responsible for keeping settings' values,
    derived from BaseSettingsManager and typically called
    XmlSettingsManager (see the example below);
2.  instantiating a `XmlSettingsDialog` class;
3.  registering your settings file and settings manager in the just
    instantiated `XmlSettingsDialog` object via `RegisterObject`;
4.  returning the instantiated object of `XmlSettingsDialog` from the
    `IHaveSettings::GetSettingsDialog ()` method.

### XmlSettingsManager example

\
\

``` {type="bash"}
xmlsettingsmanager.h:

#pragma once

#include 

namespace LeechCraft
{
namespace LMP
{
	class XmlSettingsManager : public Util::BaseSettingsManager
	{
		Q_OBJECT

		XmlSettingsManager ();
	public:
		static XmlSettingsManager& Instance ();
	protected:
		virtual QSettings* BeginSettings () const;
		virtual void EndSettings (QSettings*) const;
	};
}
}
```

\
\

``` {type="bash"}
xmlsettingsmanager.h:

#include "xmlsettingsmanager.h"
#include 

namespace LeechCraft
{
namespace LMP
{
	XmlSettingsManager::XmlSettingsManager ()
	{
		Util::BaseSettingsManager::Init ();
	}

	XmlSettingsManager& XmlSettingsManager::Instance ()
	{
		static XmlSettingsManager manager;
		return manager;
	}

	QSettings* XmlSettingsManager::BeginSettings () const
	{
		QSettings *settings = new QSettings (QCoreApplication::organizationName (),
				QCoreApplication::applicationName () + "_LMP");
		return settings;
	}

	void XmlSettingsManager::EndSettings (QSettings*) const
	{
	}
}
}
```

\
\
Don't forget to include the license header!

### Manipulating settings values

\
\
Getting a value of a setting is a matter of calling the `property ()`
method on your settings manager object, like this:

    const bool isScrobblingEnabled = XmlSettingsManager::Instance ().property ("ShouldScrobble").toBool ();
    const auto& username = XmlSettingsManager::Instance ().property ("Username").toString ();

\
\
You can also update the settings from your C++ code, and the GUI will
update itself, though that's rarely needed. For that, just call
`setProperty`, for example:

    if (UsernameConflict (username))
        XmlSettingsManager::Instance ().setProperty ("Username", username + "_lc");

### Subscribing to property changes

\
\
One calls the `BaseSettingsManager::RegisterObject` method to register a
metamethod to be invoked when a property changes. The metamethod must
have no parameters and return nothing. Please note that it isn't invoked
upon registration, so you should do that yourself if you need to.\
\
For example:

    XmlSettingsManager::Instance ().RegisterObject ("TransitionTime",
    		this, "setTransitionTime");
    setTransitionTime ();

and the `setTransitionTime ()` body:

    void Player::setTransitionTime ()
    {
    	const int time = XmlSettingsManager::Instance ()
    			.property ("TransitionTime").toInt ();
    	Source_->SetTransitionTime (time);
    }

XML description
---------------

\
\
XML description file defines a tree of settings items and their types,
like a string, an integer, a real number, a local path or a color.\
\
The basic element of the settings file is ``{type="xml"}. This is the
exact element that defines a single option, its type, default value,
human-readable name and sometimes a tooltip. The ``{type="xml"} must
have three attributes:

`type`{type="xml"}
:   Defines the type of the item, like a checkbox for boolean options, a
    line edit for strings, etc. The full list of available types is
    given in the end of this page.

`property`{type="xml"}
:   The identifier of this option. It is used to manipulate the value of
    this option via the `XmlSettingsManager` class from the C++ side.

`default`{type="xml"}
:   The default value of this option. The possible values depend on the
    option `type`, for example, a ``{type="xml"} only accepts `"true"`
    or `"false"` values, while an `` can accept literally everything.

\
\
Some option types may have additional attributes, they are documented
later on.\
\
For example (please note it's not a full XML, just a tiny bit of it):

``` {type="xml"}

	
```

\
\
The items are organized in pages (defined by the ``{type="xml"}
element), which can be further divided into tabs (defined by the
``{type="xml"} element). There are also two containers, a ``{type="xml"}
element, which just visually groups its children in UI, and
``{type="xml"}, which is an item itself and also groups its children but
also has a checkbox near its label, and the children are unavailable if
the checkbox is in the disabled state.\
\
Most items ranging from pages and tabs to every tiny spinbox out there
support labels — human-readable pieces of texts that name the option for
the user. Labels are defined by a ``{type="xml"}'s subelement
``{type="xml"}.\
\
For example, KBSwitch has the following XML setting file:

``` {type="xml"}


	
		
		
			
			
				
				
					
				
				
					
				
				
					
				
			
			
				
				
					
				
			
		
		
			
			
		
		
			
			
		
	
```

\
\
LMP module has the following:

``` {type="xml"}


	
		
		
			
		
		
			
		
		
			
		
		
			
			The following variables are allowed: <em>$artist</em>, <em>$year</em>, <em>$album</em>, <em>$trackNumber</em>, <em>$title</em>.
		
	
	
		
		
			
		
		
			
			This option requires at least one other scrobbler plugin, like LastFMScrobble, for example.
		
		
			
		
		
			
		
		
			
		
		
			
		
		
			
		
		
			
		
		
			
		
		
			
			
			
		
	
	
		
		
			
			
		
	
	
		
		
			
			
				
			
		
	
```

### Item types

#### checkbox

\
\

``` {type="xml"}
 defines a boolean option that can be toggled. It has no additional options.

Example:


	
```

#### combobox

\
\

``` {type="xml"}
 defines a combobox with a list of options, one of which can be chosen. The list may be either static or dynamic.

In case of static option lists, each option is defined by an  element, which should have a name="value" attribute. The value string is returned by the BaseSettingsManager::property() method.

An option can be marked as default by having the default="true" attribute.

Static options list example:


	
	
		
	
	
		
	
	
		
	
```

\
\
If the user selects, for example, the second option, the corresponding
`property ("SelectionBehavior").toString ()` call will return the
`QString ("NextIndex")` value.

#### dataview

\
\

    dataview item defines a view for a C++ model exposed from the plugin and registered via the XmlSettingsDialog::SetDataSource(const QString& propertyName, QAbstractItemModel *model) method.

     supports the following attributes:

    addEnabled
    If "false", adding to the model via XSD isn't allowed (for example, the Add button is inactive).
    modifyEnabled
    If "false", modifying model data via XSD isn't allowed (for example, the Modify button is inactive).
    removeEnabled
    If "false", removing data from the model via XSD isn't allowed (for example, the Remove button is inactive).


    Please note that dataviews don't have any labels, thus the  subelement is ignored.

    The exposed model must have the exact and constant number of columns. Hierarchical models aren't supported. It must also have data for the following roles on its horizontal header items:


    Qt::DisplayRole
    The human-readable name of the setting.
    LeechCraft::DataSources::DataSourceRole::FieldType
    Must contain an int value equal to a member of the LeechCraft::DataSources::DataFieldType enumeration.
    LeechCraft::DataSources::DataSourceRole::FieldValues
    A QVariantList of QVariantMaps with the possible values of the type corresponding to the FieldType of the item. Currently only used for DataFieldType::Enum items. The maps should contain the following keys:

    Icon with a value of type QIcon.
    Name with a value of type QString.
    ID with a vlaue of any type, it will be passed back in addRequested function.



    Stuff in the LeechCraft::DataSources namespace is defined in xmlsettingsdialog/datasourceroles.h header.

    The model columns are expected to contain values of types corresponding to the DataSourceRole::FieldType.

    Moreover, the exposed model must have a parent, and the parent must have the following methods for adding, modifying and removing of rows to work correctly:

    void addRequested (const QString& propertyName, const QVariantList& datas)

    const QString& propertyName is the value of the property attribute of the dataview item. It is used to distinguish between different dataviews having models with the same parent.
    const QVariant& datas is the variant list with the data of the row to append. one variant per column.


    void modifyRequested (const QString& propertyName, int row, const QVariantList& datas)

    const QString& propertyName is the value of the property attribute of the dataview item. It is used to distinguish between different dataviews having models with the same parent.
    int row is the index of the row to modify.
    const QVariant& datas is the variant list with the data of the row to append. one variant per column.


    void removeRequested (const QString& propertyName, const QModelIndexList& rows)

    const QString& propertyName is the value of the property attribute of the dataview item. It is used to distinguish between different dataviews having models with the same parent.
    const QModelIndexList& rows is the list of the rows to remove. The list is sorted in reverse order so you can just iterate over it and remove the indexes from the model.




    Example:

    
