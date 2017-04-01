---
title: Extending New Life with new importers
tags: tutorial, new life, development
published: 2010-11-26T21:01:53
parentPage: development-newlife
---

New Life's sources are located in `/src/plugins/newlife`.\
\
Let's take the [Akregator](http://akregator.kde.org/) importer as an
example and look from the end to the beginning.

Registering the importer
------------------------

\
\
Akregator importer registers itself within New Life by doing
`Importers_ << new AkregatorImporter (this);` in file
`importwizard.cpp`, in the `ImportWizard`'s constructor. Let's take a
look at `AkregatorImporter` class now.

Writing the Importer class
--------------------------

\
\
Your importer should derive from the `AbstractImporter` class (which
itself derives from `QObject`), which is defined in the
`abstractimporter.h`. `AbstractImporter` has two pure virtual functions
that you need to implement in your importer:

    virtual QStringList GetNames () const = 0;
    virtual QList GetWizardPages () const = 0;

\
\

    GetNames returns the list of names that will refer to your importer. Most likely, you will want to return the name of the application that the importer is working with. To find the exact name that was selected by the user in the wizard, you can use the QString ImportWizard::GetSelectedName () const function.

    GetWizardPages returns the list of wizard pages from your importer. They will be added to the wizard if a name which belongs to your importer is selected. The pages are added to the wizard in the order they appear in the returned list. The last returned page should reimplement the QWizardPage::nextId function and return -1. Otherwise, the wizard will continue to the next registered importer.

    Let's look how these virtuals are implemented in the @AkregatorImporter@.
    QStringList AkregatorImporter::GetNames () const
    {
        return QStringList ("Akregator");
    }
    Here we return the list of just one entry, Akregator.

    GetWizardPages returns a list of just one page, since we don't need more in this importer:
    QList AkregatorImporter::GetWizardPages () const
    {
        QList result;
        result << ImportPage_;
        return result;
    }

    ImportPage is AkregatorImporter's member and is initialized in its constructor:

    AkregatorImporter::AkregatorImporter (QWidget *parent)
    : AbstractImporter (parent)
    {
        ImportPage_ = new AkregatorImportPage ();
    }

\
\
Please note that it's better to change the type of the `parent`
constructor parameter to `ImportWizard*` (`ImportWizard *parent`) if you
plan to use its `GetSelectedName` function (mentioned above).\
\
Now let's see how the `AkregatorImportPage` is implemented.

Sample wizard page implementation
---------------------------------

\
\
The `AkregatorImportPage` is declared as:

    class AkregatorImportPage : public QWizardPage
    {
        Q_OBJECT

        Ui::FeedsSettingsImportPage Ui_;
    public:
        AkregatorImportPage (QWidget* = 0);

        bool CheckValidity (const QString&) const;
        virtual bool isComplete () const;
        virtual int nextId () const;
        virtual void initializePage ();
    private slots:
        void on_Browse__released ();
        void handleAccepted ();
    signals:
        void gotEntity (const LeechCraft::DownloadEntity&);
    };

    Ui_ is the UI of the page created in Qt Designer. Refer to its documentation for more details.

    FeedsSettingsImportPage is a common page. It contains:

    ImportSetitngs_ checkbox. Usually it gives the user the freedom to import both data and source application's settings or data only.
    FileLocation_ line edit. You can use it, for example, to allow the user to select a different location of source data/settings.
    Browse_ push button.


    Of course, you can create your own UI for your pages.

    gotEntity signal is emitted when the import parameters are set and the import is accepted (by pressing "Finish" button in the wizard, for example). The corresponding Entity structure carries information about the imported data. An information passed using Entity depends on an agreement between your importer and a plugin which you are importing into, or by a common protocol defined by the targer plugin.

    The constructor sets up the UI:
    AkregatorImportPage::AkregatorImportPage (QWidget *parent)
    : QWizardPage (parent)
    {
        Ui_.setupUi (this);
        Ui_.ImportSettings_->setText (Ui_.ImportSettings_->text ().arg ("Akregator"));

        setTitle (tr ("Akregator's feeds import"));
        setSubTitle (tr ("Select Akregator's feeds file and options"));
    }

    Utility function CheckValidity checks whether the selected location (contents of FileLocation_ line edit) is valid source of data or settings or not. It returns true if it is and false otherwise. In our case, we perform basic checks to see whether the file is a valid OPML document:
    bool AkregatorImportPage::CheckValidity (const QString& filename) const
    {
        QFile file (filename);
        if (!file.exists () ||
                !file.open (QIODevice::ReadOnly))
            return false;

        QDomDocument document;
        if (!document.setContent (&file, true))
            return false;

        QDomElement root = document.documentElement ();
        if (root.tagName () != "opml")
            return false;

        QDomNodeList heads = root.elementsByTagName ("head");
        if (heads.size () != 1 || !heads.at (0).isElement ())
            return false;

        QDomNodeList bodies = root.elementsByTagName ("body");
        if (bodies.size () != 1 || !bodies.at (0).isElement ())
            return false;

        if (!bodies.at (0).toElement ().elementsByTagName ("outline").size ())
            return false;

        return true;
    }

    We reimplement the QWizardPage::isComplete function to notify the wizard whether the entered data is valid or not:
    bool AkregatorImportPage::isComplete () const
    {
        return CheckValidity (Ui_.FileLocation_->text ());
    }

    Our QWizardPage::nextId reimplementation always returns -1 since it's the only page in the importer and no pages should follow.
    int AkregatorImportPage::nextId () const
    {
        return -1;
    }

    Reimplementation of QWizardPage::initializePage initializes the page before the first show. This allows us to perform initializations which are only required if our importer's name was selected. For user convenience we also check the default file location whether it contains the correct file, and if it does, we use it.
    void AkregatorImportPage::initializePage ()
    {
        connect (wizard (),
                SIGNAL (accepted ()),
                this,
                SLOT (handleAccepted ()));

        connect (this,
                SIGNAL (gotEntity (const LeechCraft::DownloadEntity&)),
                wizard (),
                SIGNAL (gotEntity (const LeechCraft::DownloadEntity&)));

        QString defaultFile = QDir::homePath () + "/.kde/share/apps/akregator/data/feeds.opml";
        if (CheckValidity (defaultFile))
            Ui_.FileLocation_->setText (defaultFile);
    }

    In the on_Browse__released we show a file selection dialog:
    void AkregatorImportPage::on_Browse__released ()
    {
        QString filename = QFileDialog::getOpenFileName (this,
                tr ("Select Akregator's OPML file"),

                QDir::homePath () + "/.kde/share/apps/akregator/data",
                tr ("OPML files (*.opml *.xml);;All files (*.*)"));
        if (filename.isEmpty ())
            return;

        if (!CheckValidity (filename))
        {
            QMessageBox::critical (this,
                    tr ("LeechCraft"),
                    tr ("The file you've selected is not a valid OPML file."));
            return;
        }

        Ui_.FileLocation_->setText (filename);
    }

    Finally, in the handleAccepted slot we check if the import settings are correct (just in case), create a suitable Entity structure, fill it with data and emit the gotEntity signal with that structure. We only fill it with settings if the corresponding check box is selected:
    void AkregatorImportPage::handleAccepted ()
    {
        QString filename = Ui_.FileLocation_->text ();
        if (!CheckValidity (filename))
            return;

        DownloadEntity e = Util::MakeEntity (QUrl::fromLocalFile (filename),
                QString (),
                FromUserInitiated,
                "text/x-opml");

        if (Ui_.ImportSettings_->checkState () == Qt::Checked)
        {
            QSettings settings (QDir::homePath () + "/.kde/share/config/akregatorrc",
                    QSettings::IniFormat);
            if (settings.status () == QSettings::NoError)
            {
                if (settings.contains ("Show Tray Icon"))
                    e.Additional_ ["ShowTrayIcon"] = settings.value ("Show Tray Icon");
                if (settings.contains ("Fetch On Startup"))
                    e.Additional_ ["UpdateOnStartup"] = settings.value ("Fetch On Startup");
                if (settings.contains ("Auto Fetch Interval"))
                    e.Additional_ ["UpdateTimeout"] = settings.value ("Auto Fetch Interval");

                settings.beginGroup ("Archive");
                if (settings.contains ("Max Article Number"))
                    e.Additional_ ["MaxArticles"] = settings.value ("Max Article Number");
                if (settings.contains ("Max Article Age"))
                    e.Additional_ ["MaxAge"] = settings.value ("Max Article Age");
                settings.endGroup ();

                e.Additional_ ["UserVisibleName"] = tr ("Akregator settings");
            }
            else
                QMessageBox::critical (0,
                        tr ("LeechCraft"),
                        tr ("Could not access or parse Akregator settings."));
        }

        emit gotEntity (e);
    }

    Documentation for Entity could be found in documentation for the corresponding plugin, typically, by the "entity handlers" tag.

    Notes


    Please note once again that the final page of your importer should return -1 from nextId overload.
    Don't forget to add all your *.ui, *.h and *.cpp files to the CMakeLists.txt.