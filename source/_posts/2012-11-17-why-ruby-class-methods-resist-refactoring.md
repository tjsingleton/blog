---
layout: post
title: Why Ruby Class Methods Resist Refactoring
tags:
- Clips
published: true
---
This is a well written post that looks a why choosing to use a class method may not make sense. It's coincidental that this morning I read this. Last night I was rewriting a job. After my tests were green and I was ready to refactor I noticed that I could simply inline the method into the class <kbd>perform</kbd>. I refrained, perfering the simple class instead.

I thought also about the 24th <a href="http://devblog.avdi.org/rubytapas-episode-list/">RubyTapas</a> on incidental change. If you start out with a class method and decide to refactor to an object, then there is more change involved than refactoring an existing instance method.

<a href="http://blog.codeclimate.com/blog/2012/11/14/why-ruby-class-methods-resist-refactoring/">Why Ruby Class Methods Resist Refactoring</a>
