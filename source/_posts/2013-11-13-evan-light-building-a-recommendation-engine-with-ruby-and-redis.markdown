---
layout: post
title: "Evan Light - Building a Recommendation Engine with Ruby and Redis"
date: 2013-11-13 08:29
comments: true
categories: 
  - Programming 
---

## Context: Social soccer network. 

* Wanted a live feed of soccer data. 
* Display popular and relevant posts in near real time

Approximation

* Popular: easy, measurable 
* Relevant: relative, subjective

Why didn't we use better statistical methods? Clients just wanted to build it and trusted me. I pushed for it.

Why ruby? I thought Java might be a better fit. Java is fast. Client's dev knew ruby.

## Case Study 

**Nouns:** User, Post, Comment, Team, Player

**Verbs:** Submit, Comment, Like

Popular based on comments, likes, and "taste makers". Taste makers were influential people.

Relevance based on likes, comments, and if the term was mentioned in the past.

Algorithm was O(n^2), but we were able to limit n to 3 days.


## Lessons learned

* Use strings instead of hash when need to put a time to live on the hash value
* Minimize chattiness with pipelining or LUA scripting
* Prune old data by adding a timestamp and remove on insert
* More functional programming. Already stateless. Increase referential transparency. 
* Us a runtime faster than ruby

----

Notes from RubyConf 2013

[Evan Light](https://twitter.com/elight)


