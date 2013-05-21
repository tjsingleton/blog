---
layout: page
title: "Certifiable Ruby Nerd"
date: 2013-05-17 11:23
comments: false
sharing: false
footer: false
---

You can contact me via email at [tjsingleton@me.com](mailto:tjsingleton@me.com).

My resume is available for download in [PDF](https://dl.dropboxusercontent.com/u/105108/resume/tjsingleton-resume.pdf)
or [Word](https://dl.dropboxusercontent.com/u/105108/resume/tjsingleton-resume.doc). I've also filled out profiles on
sites like [Linked In](http://www.linkedin.com/in/tjsingleton) and
[Careers 2.0](http://careers.stackoverflow.com/tjsingleton) where you can read it online.


## Sample Work

### Product: Crunched

I've spent the last 3 years working on Crunched. It is a slide sharing and meeting platform that offers you insights in
to the behaviors of your audience. [Sign up for a free account](http://www.crunched.com/) at Crunched to demo my work.

* [Crunched Overview](http://www.crunched.com/access/7395f057b67a482cd3693ae6c89e6c5a)
* [Register](http://www.crunched.com/)

### Demo: StatsD Server

At Crunched we use statsd to track interesting metrics. We wanted a simple way to deploy it to our servers without
having to manage Node.JS, so we chose a [ruby version](https://github.com/quasor/statsd). At the time the ruby version
did not support gauges. I was inspired by the simple server to try my hand at an implementation. One interesting aspect
is the [ragel parser](https://github.com/tjsingleton/statsd-server-ruby/blob/master/ext/statsd/statsd_parser_common.rl)
I wrote for it which proved to be [crazy fast](https://gist.github.com/tjsingleton/57a90d921b58fcba7883).

* Source: https://github.com/tjsingleton/statsd-server-ruby

### Demo: IP Geolocation

This is a simple project that allows you to look up geolocation data for an IP address. It uses a database from
[MaxMind](dev.maxmind.com/geoip/legacy/geolite) which is provided as a binary file. I did not want to check this file
into git since it would bloat the repository each month as the binary changed. Instead, I packaged it as a
[gem](http://rubygems.org/gems/geoip-db) which lets me package and deploy it simply.

* Web App: http://geoip-app.herokuapp.com/
* Source: https://github.com/tjsingleton/geoip-app
* API Documentation: http://geoip-app.herokuapp.com/doc/
* Data Gem: https://github.com/tjsingleton/geoip-db


### RMU Projects

I took part in the first session of [Ruby Mendicant University](http://mendicantuniversity.org) and these are the
projects that I worked on as part of it.

* [IPTables Parser](https://github.com/tjsingleton/s7-e1): a recursive decent parser for the output of iptables-save
* [Zip Reader](https://github.com/tjsingleton/s7-e3/): a pure ruby library for extracting files out of zip archives
* [Fishing Log](https://github.com/tjsingleton/fishing-log): a simple dsl for recording your fishing trip and a cli tool to filter the data
* [Export Assignments](https://github.com/tjsingleton/s7-e4/commits/): allow assignments to be exported in gzipped json or yaml

### Find out more

You can check out my [github profile](https://github.com/tjsingleton) for more examples.


## Writing & Reading

Here are some technical posts that I've written:

<ul>
  {% for post in site.categories['Programming'] limit: 5 %}
    <li class="post">
      <a href="{{ root_url }}{{ post.url }}">{% if site.titlecase %}{{ post.title | titlecase }}{% else %}{{ post.title }}{% endif %}</a>
    </li>
  {% endfor %}
</ul>


I am subscribed to a couple hundred feeds and am know for sharing the juicy bits I find. I started posting them as a way
to share them with my friends en masse. I've failed to post as regularly as I'd like and have about 75 links queued up
in evernote to post. Here are some recent clips:

<ul>
  {% for post in site.categories['Clips'] limit: 5 %}
    <li class="post">
      <a href="{{ root_url }}{{ post.url }}">{% if site.titlecase %}{{ post.title | titlecase }}{% else %}{{ post.title }}{% endif %}</a>
    </li>
  {% endfor %}
</ul>

