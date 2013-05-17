---
layout: post
title: You Failed. Autotest with a voice.
category: Programming
tags:
- Ruby
published: true
---
While listening to <a href="http://rubyconf2008.confreaks.com/better-hacking-with-training-wheels.html">a talk from Ruby Conf 08</a>, I heard <a href="http://jrmiii.com/">Joe Martinez</a> mention the <a href="http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/say.1.html"><kbd>say</kbd></a> command in OS X. I figured I'd pop open my .autotest file and wire it up so it'd give me some motivation for when my specs go red. 

Here is what I added:

``` ruby
Autotest.add_hook :red do |autotest|
  `say -v "Good News" "You're doing it wrong"`
end
```
