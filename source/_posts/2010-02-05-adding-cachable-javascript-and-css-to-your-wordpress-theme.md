---
layout: post
title: Adding Cachable Javascript and CSS links to your Wordpress Theme
category: Programming
tags:
- Wordpress
published: true
---
Here is a great technique for adding a timestamp to your the javascript and css for your theme using <a href="http://codex.wordpress.org/Function_Reference/wp_enqueue_script">enqueue_script</a> and <a href="http://codex.wordpress.org/Function_Reference/wp_enqueue_style">enqueue_style</a>. The benefit is you can set a <a href="http://developer.yahoo.com/performance/rules.html#expires">far future expires header</a> and maximize the caching benefit without having to worry about cache invalidation. This technique should be familiar to any Rails devs as it's baked in.

The magic is that the one of the optional parameters of the enqueue_* functions is a version. We can use php's <a href="http://www.php.net/manual/en/function.filemtime.php">filemtime</a> function to get the last modified time of the file as a timestamp and use it for the version. Wordpress appends the version to the end of the url like "http://yoursite.com/wp-content/themes/your-theme/style.css?ver=1265429348". Now you don't have to worry about serving stale data since every time you edit the file the url will be updated.

Here is some example code:

``` php
function theme_assets() {
  $stylesheet_url = get_bloginfo('stylesheet_url');
  $stylesheet_path = TEMPLATEPATH."/style.css";
  $stylesheet_mtime = filemtime($stylesheet_path);
  wp_enqueue_style("my_theme", $stylesheet_url, false, $stylesheet_mtime, "screen");

  $javascript_url = get_bloginfo('stylesheet_directory')."/my_theme.js";
  $javascript_path = TEMPLATEPATH."/my_theme.js";
  $javascript_mtime = filemtime($javascript_path);
  wp_enqueue_script('my_theme', $javascript_url, false, $javascript_mtime, true);
}

add_action('template_redirect', theme_assets);
```
