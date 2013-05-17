---
layout: post
title: Sometimes programming problems are best solved AFK
category: Programming
tags:
- Ruby
published: true
---
This afternoon I ran into a problem. I was working on adding in some new form fields on an edit screen. The fields were for an associated model. I was using `fields_for` in the view and `accepts_nested_attributes_for` in the model. Everything looked great, but my specs were still failing. The form just wasn't updating the association.

I desk checked the code. I tried it in <kbd>script/console</kbd>. I checked the controller logs. I tried everything I could think of.  I struggled for an hour or so before I called in for help. By then end of the day, neither a more experienced developer or myself could figure out why it wasn't working.  We were ready to blame plugins, rails, or anything else. Looking over the code, everything looked correct.

Calling the `@my_model.my_association_attributes=` worked, but the controller was never calling it! Can you guess what the culprit was?  The model had `attr_accessible` set!

So is the moral of the story to add the association_attributes on models with `attr_accessible`? Not exactly, see I didn't solve the problem at my desk. I solved the problem on the way home from church about two and a half hours later. I wasn't even thinking about the problem when it popped in my head.

Sometimes the right course of action is to just step away from the problem for awhile, and let our mind work on it. A week or so ago, I had struggled for a couple hours trying to figure out how to solve a particular problem cleanly. I had about half a dozen ways to solve it, but thinking of actually implementing any of them made me feel dirty. I knew there was a good way to solve this problem.

How did I come up with a solution? I slept. When I woke up, brushed my teeth, and fired up textmate the next morning in my head was a elegant (and obvious) solution to the problem at hand. Sometimes our minds just need a break.

Next time you get frustrated, step away for a bit. Let your mind relax and refresh. AFK isn't as bad as it sounds, and sometimes it's medicinal.
