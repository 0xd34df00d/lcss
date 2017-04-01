---
title: Entity variants handled by CSTP
tags: development, cstp, entity handlers
published: 2010-11-26T22:28:46
parentPage: development-cstp
---

`Entity::Entity_` could contain data of two types: either
`QNetworkReply*` or `QUrl`. In all other cases the entity is
automatically rejected.\
\
If `Entity::Entity_` could be converted to `QNetworkReply*`, the entity
is accepted and that reply is downloaded.\
\
If `Entity::Entity_` could be converted to `QUrl` and its scheme is
*file*, *http* or *https*, the entity is accepted. Otherwise it is
rejected.