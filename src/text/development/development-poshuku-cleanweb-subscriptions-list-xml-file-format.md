---
title: Poshuku CleanWeb subscriptions list XML file format
tags: poshuku, development
published: 2010-11-25T08:50:24
parentPage: development-poshuku
---

Each subscription is defined by subscription element which must have url
and name attribute and can also have optional purpose attribute. url's
value is the abp:-schemed URL to the subscription, name is the name of
this subscription. purpose is the purpose of the subscription —
human-readable information about what this subscription blocks.\
\
Since some subscriptions may be dependent on others, the file is
hierarchical:

    subscription

s can be nested.\
\
And all this is better illustrated by example:\
\

``` {type="xml"}

  
  
  
   
    
  
```
