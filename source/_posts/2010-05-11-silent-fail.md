---
layout: post
title: The Danger of the Silent Fail
category: Programming
tags:
- Ruby
published: true
---
I came across a bug in an rails app I wrote today. This thing was driving me crazy. I was generating a random 10 digit number for my model, however about one-third of the time in production the number was getting set to the same thing, 2147483647.

I wrote some specs but couldn't reproduce the behavior. I was pretty frustrated. I logged into the server and went into the console to test it out, and it was failing. I'd update the number, save it, reload the instance and there to my dismay was the haunting 2147483647.

What was it? Locally I was using sqlite to run the test, while on the server I was using mysql. 2147483647 is the largest 32bit signed integer. I was overflowing the column, however mysql was silently accepting the larger number, and truncating it to 2147483647.

I would have assumed that trying to set a value greater than available would have raised an exception. Sadly, this wasn't the first time mysql has silently failed on me.  It probably won't be the last. Still goes to demonstrate the frustration that can result from unexpected behavior.
