---
layout: post
title: "Better Acceptance Tests with Page Objects"
date: 2013-06-04 22:35
comments: true
category:  Clips
---

Recently, I tried organizing acceptance tests around an actor/user class. These classes became unwieldily the more areas of the site they interacted with. In hindsight modeling the page instead of the actor makes much more sense. I recently came across a couple libraries that implemented this pattern, however I haven't tried either yet.

* [Better Acceptance Tests with Page Objects](http://robots.thoughtbot.com/post/35776432958/better-acceptance-tests-with-page-objects)
* [SitePrism: Page Object Model DSL for Capybara](https://github.com/natritmeyer/site_prism)
* [Test::Page: ... implementing Page Objects pattern.](https://github.com/jarmo/test-page)