---
layout: post
title: Regex Result Access Benchmark
tags:
- Ruby
category: Programming
published: true
---
The question came on <a href="http://forrst.com">forrst.com</a> about which of the following two styles of accessing the results of a regex match were preferred:

``` ruby
"qqq100601.txt"[/\A([a-z]+)/, 1]
"qqq100601.txt".match(/\A([a-z]+)/)[0]
```

So I benchmarked it and was surprised that there was such a difference in the performance. Except on jruby, the array style access is the clear winner.

{% img /images/Screen-shot-2010-07-01-at-4.23.46-AM.png 545 408 "Graph of Results" %}

<a href="http://gist.github.com/459719">Benchmark and Raw Results</a>

<strong id="update">Update</strong> I went ahead and ran this through <a href="http://gist.github.com/459719#file_3_ruby_prof.txt">RubyProf</a> in 1.8.7. It turns out that #[/REGEXP/] is optimized to one method call and doesn't instantiate the MatchData object. String#match is delegated to Regexp which instantiates MatchData and then accesses the result for a total of 3 method calls. So the real savings is less object churn and method calls. 
