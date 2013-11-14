---
layout: post
title: "Jason Clark - Extending Gems"
date: 2013-11-08 22:47
comments: true
categories: 
  - Programming
---

## Pass it in 

* **Loggers:** Let them hand you an Object. Dependency Injection is easy in Ruby because of Duck Typing. Still has risks. Provide a spec to communicate contract.

* **Instrumentors:** Example Excon. Only one instrumentor allowed. Can't use without stomping on someone else's instrumentor.

* **Backends:** Example DelayedJob with ActiveRecord. 

* **Gem Specific:** Example Resque's hooks. Has great docs.

## Events 

Notify external code important things have happened. Example simple events (on github). 

**Surfacing**: You should front load. Make it easy to access. Example: `NR::instance.events.subscribe { ... }` or `Resque.after_fork { ... }`. 

*Be wary of things that are accept only one thing.* Older versions of Resque only allowed one hook. Things would get stomped over.

Event ordering is iffy. If important, maybe do something different. 

## Middleware

Example is Rack. Have to be careful with the `env`. Everyone can modify. Can have a problem of seeing the whole chain. Sidekiq does a good *job* of seeing the whole chain. 

## Lifecycle 

**Forking**: provide before & after hooks. Not everything carries over in a fork. Forks, Threads and Locks combined can be trouble. 

**Loading gems**: Unicorn has two models for loading up. Preload: true or false. In one the hooks are called before the gems are loaded. Gems can't take part in the hooks. 

## Names and Paths

**Paths**: `Sequel.plugin :newrelice` expects files to be in your libs top level directory. Maybe it'd be better just to provide a class/module. 

**Generic Names**: `ActiveRecord`, `DataMapper`, and `HTTPClient` are very generic. Now you can't use those names in your app. Be careful about using stdlib names like Logger, Thread. Constant resolution issues may occur. Gem writters should be careful about module lookup. Be explicit and use the `::` operator as needed.

## Config

YML was made for it. YML + erb is bearable. Maybe just use ruby instead. 

Be sure to expose the configuration to in system and not just via file. File only is hard for gems to work with. Think `Lib.configure { ... }`. 

## Docs

README, most people won't get past it. Sidekiq has a great experience. Don't bury important things in the docs. 

Make versioning part of your docs.



---- 

Notes from RubyConf 2013.

* [Jason Clark](https://github.com/jasonrclark) 
* [Slides](https://speakerdeck.com/jasonrclark/extending-gems-patterns-and-anti-patterns-of-making-your-gem-pluggable)

