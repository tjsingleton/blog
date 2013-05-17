---
layout: post
title: Remove the Genesis Favicon
category: Programming
tags:
- Wordpress
published: true
---
``` php
remove_action('genesis_meta', 'genesis_load_favicon');
```