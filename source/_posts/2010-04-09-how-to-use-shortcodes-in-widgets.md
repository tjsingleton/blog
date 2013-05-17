---
layout: post
title: How to use shortcodes in widgets
category: Programming
tags:
- Wordpress
published: true
---
Want to use shortcodes in your text widget? Just add this snippet to your functions file.

``` php
add_filter('widget_text', 'shortcode_widgets');
function shortcode_widgets($widget_text) {
  ob_start();
  do_shortcode($widget_text);
  $captured_content = ob_get_contents();
  ob_end_clean();
  return $captured_content;
}
```