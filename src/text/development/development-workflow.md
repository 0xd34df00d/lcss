---
title: Workflow
tags: development
published: 2012-02-11T14:41:34

---

Workflow
--------

\
\
There are three different approaches to the development workflow:\
\

Fork-tree
:   You fork the project by the means of GitHub. This is currently the
    best way to contribute to LeechCraft: you have your own repo, with
    your rules and whatever you like, and we just see one of your
    branches that we occasionally integrate with ours.

Separate git remote
:   You clone the main repo somewhere else and tell us where it is, thus
    basically becoming another remote besides main one. This is somewhat
    similar to the *fork-tree* approach.

Out-of-tree
:   You manage your files yourself. This is the longest way to get your
    changes into official distribution.

\
\
You'd need a GitHub account for the first approach.

### Fork-tree

\
\
It's the preferred way to contribute to LeechCraft.\
\
You fork the [project on
GitHub](http://github.com/0xd34df00d/leechcraft) and do whatever you
like to your fork. There is an excellent
[guide](http://help.github.com/fork-a-repo/) about forking on GitHub.\
\
When you think you are ready to get something merged from your fork into
upstream, you [send a pull
request](http://help.github.com/send-pull-requests/) to us. We review
the changes, comment on some if there are any problems with
logic/style/etc., you fix your code accordingly, and when the code is
ready, we merge it into our codebase.\
\
You would also need to occasionally merge changes from our repo to your
fork. Please **don't** use the Fork Queue feature of GitHub for that.
Instead, use the following command:

``` {type="bash"}
git pull git://github.com/0xd34df00d/leechcraft.git masterIt would merge the changes from our master branch to the branch you are currently on.

Separate git remote

You clone main LeechCraft's git repo (at git://github.com/0xd34df00d/leechcraft.git) and make it publically available. After that if you want your changes merged back in the master (and sure you do!) you just tell us when you've committed something to the repo. Or, better, you setup an RSS feed for your repo and tell us its address. That way, we would know about new commits automatically.

Out-of-tree

Well, since LeechCraft supports building plugins without keeping them in LeechCraft source tree, you can always use a separate repo (or even don't use any VCS at all). In this case you would likely need to contact us anyway to merge your changes to our codebase.

For that, you'd generally post an issue with "Patch" category to our issue tracker. We review it and either accept or decline (and close the issue in both cases) or tell you what should be improved. You improve it, update the issue for this patch, and the cycle repeats.

Notes

Translations

It would be great if you'd use git, since it's much easier to maintain the continiously changing files (and translations) in it. Nevertheless, if you don't like git or don't want it to use it for some reason, just ask us to generate the translation files for the required language, after that we send you those files and you send them back when finished. It's better to work in small chunks since the codebase, features and, consequently, translation files may change.
```