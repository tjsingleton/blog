---
layout: post
title: Example of my JavaScript Skills – Blackjax
category: Programming
published: true
---
I was asked to provide some JavaScript for a job interview.  Awhile ago I had started to build a JavaScript version of blackjack. I got the idea from while reading "The Object-Oriented Thought Process." In the sixth chapter Matt Weisfeld used Blackjack as a case study of *Designing with Objects.*<!--more-->

Without further adu, I introduce <a href="http://www.draftdepot.com/blackjax/">Blackjax</a>. It is a simple blackjack game built with JavaScript. I use jQuery to for it's convenience functions and effects.

My focus has been more on the core of the game itself, so there are some things that aren't as polished as others. One example is the form to add players and start the game. Depending on my free-time and pressure from friends I may continue to build upon it.

###Challenge for my fellow code geeks
I'd love for you to send me your thoughts on the JavaScript. Let me know how you'd have done it differently. I have refactored the code several times and still am not 100% satisfied with it.

One area that I know needs improvement is handling aces. The logic I am using for the possible double value (1, 11) of an ace is oversimplified and can lead to poor choices by the dealer. For instance, two aces will always equal 2, and never 12.

One suggestion that was given to me is to change how I wrote the objects. <a href="http://www.timnovinger.com/">Tim Novinger</a> suggested I switch to <a href="http://pastie.org/261449">a Object Literal approach</a>.  The reason I choose to use functions as objects is the ability to create a new instance of objects.

###Does refactoring ever stop?
I tried my best to showcase best practices when it came to the design of objects. I spent most of the day yesterday refactoring the code. The last change I made was to separate all the core logic of the game from the display logic. I'm not fully satisfied on how the outcome, but it is much better than before. If you wanted to change from jQuery to mootools it would only effect the display class.

It would be best to refactor the the display code up into smaller objects. The fact that the "BlackjackFrontend" object is responsible for displaying the card just doesn't sit well with me. I'd also like to refactor blackjack specific information from the "Player" object to an one that extends the "Player" to maximize the potential for code reuse.

I think I could refactor this code to death.

###Demonstrating the need for testing
This project really taught me the need for unit tests and automated testing. The form of automated testing I used was my dear wife, and I have to thank her for her diligent efforts. Her poor fingers from having to refresh until a specific situation occurred. I still am not sure what would happen if everyone got a blackjack on the deal.

In short, I have placed "Find JavaScript testing framework" on my to-do list.

Overall, I think <a href="http://www.draftdepot.com/blackjax/">Blackjax</a> is a solid example of my understanding of JavaScript and a lot more fun that table sorting or form validation. Hopefully it will serve me well.
