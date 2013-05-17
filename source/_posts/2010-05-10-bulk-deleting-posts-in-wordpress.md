---
layout: post
title: Bulk deleting posts in WordPress
category: Programming
tags:
- Wordpress
published: true
---
I was importing posts into wordpress and messed up. It's not uncommon.  I normally have a couple failed attempts, before I get everything zeroed in with a new csv template.  

I've learned my lesson in the past so I always set the post author to a distinct user to easily bulk delete posts based on the post_author with sql.

``` sql
DELETE FROM wp_postmeta 
WHERE post_author = 50
```

However, this leaves trash in the wp\_postmeta table so now we just clean that up by deleting everything without a entry in wp_posts.

``` sql
DELETE FROM wp_postmeta
WHERE post_id NOT IN (
  SELECT id
  FROM wp_posts
)
```

Now that there is no trace of my failed attempt I can reprocess the file, hopefully successfully this time. 
