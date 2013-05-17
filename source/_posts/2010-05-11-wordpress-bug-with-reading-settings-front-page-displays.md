---
layout: post
title: Wordpress Bug with Reading Settings, Front Page Displays
category: Programming
tags:
- Wordpress
published: true
---
{% img /images/Screen-shot-2010-05-11-at-3.08.16-PM.png 558 200 %}

I came across a bug today where despite the fact the Reading settings were set to the latest posts, that the Front Page setting was still affecting the menu structure of wordpress.

Notice in the following images that "About" page is absent from the breadcrumbs, and is marked as excluded from the navigation.

{% img /images/Screen-shot-2010-05-11-at-3.08.48-PM.png 419 117 %}

{% img /images/Screen-shot-2010-05-11-at-3.08.29-PM.png 229 55 %}
{% img /images/Screen-shot-2010-05-11-at-3.09.05-PM.png 294 101 %}

<p class="clear">The fix is simple. Just update the Front Page setting to the empty option and the menu correct hierarchy is restored.</p>
