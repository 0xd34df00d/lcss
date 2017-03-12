---
title: Entity variants handled by SeekThru
tags: seekthru, entity handlers, development
published: 2010-11-26T20:41:02

---

SeekThru only handles the entity if `Entity::Entity_` could be converted
to `QUrl`, its scheme is either *http* or *https* and `Entity::Mime_` is
*application/opensearchdescription+xml*. In this case it adds the
opensearch description at the given URL.