---
layout: post
title: Speeding up the Haversine Formula in Ruby
category: Programming
tags:
- Ruby
published: true
---
A friend of mine's work deals a lot with geographical data. He was working on clustering large sets of coordinates into .25 mile groups and sent me over a small sampling to play with. By small, I mean a 8,736 coordinates. His real data set is much, much larger.

He had started off by utilizing <a href="http://geokit.rubyforge.org/">GeoKit</a>, but I noticed that the only thing he was using it for was to calculate distance. His was nicely encapsulated, but this is basically what it was doing.

```ruby
point_a = Geokit::LatLng.new(39.416454,-118.841204)
point_b = Geokit::LatLng.new(39.476181,-118.783931)
point_a.distance_to(point_b, :units => :miles)
```

I assumed there was some overhead involved in the library, so I wrote <a href="http://github.com/tjsingleton/haversine_benchmark/blob/master/ruby_haversine.rb">my own implementation</a> of the <a href="http://en.wikipedia.org/wiki/Haversine_formula">haversine formula</a>. I did see a slight performance increase, but not much. Geokit seemed to do a pretty good job at staying efficient. 

Enter RubyInline. <a href="http://www.zenspider.com/ZSS/Products/RubyInline/">RubyInline</a> is a gem that allows you to write other languages inside your ruby code. It comes with out of the box support for C/C++. I had been wanting to play with RubyInline for awhile, but nothing had come across my plate that needed that level of optimization.

I translated the haversine formula to <a href="http://github.com/tjsingleton/haversine_benchmark/blob/master/inline_haversine.rb">C++ using RubyInline</a> and the results were amazing.  On my machine I was able to reduce the time it took to calculate 1,000,000 distances from 11.247408 seconds to 0.679327 of a second. It only took me a few minutes to rewrite the method  and from an API standpoint it is identical to the pure ruby version. 

The next time you're doing work that is easily optimized with C, like this math formula, give a shot and be reap the rewards. The code and benchmarks are on <a href="http://github.com/tjsingleton/haversine_benchmark">github</a>.
