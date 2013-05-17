---
layout: post
title: An Authlogic trick for speeding up your test suite
category: Programming
published: true
---
Here is a quick tip for speeding up your test suite if you use Authlogic. In production we use it's BCrypt provider, but it's designed to be slow. That's when it comes to preventing an attacker from trying to compromise you user's passwords, but slow is not a word we want to hear when it comes to tests. Authlogic makes it really easy to swap out the provider.

We just have to provide a module the responds to `encrypt` and `matches?`. Here is what I use:

``` ruby
module SpecCryptoProvider
  def self.encrypt(*tokens)
    tokens.join("")
  end

  def self.matches?(crypted, *tokens)
    encrypt(*tokens) == crypted
  end
end
```

Then to swap it in we just have to assign it like:

``` ruby
User.crypto_provider = SpecCryptoProvider
```

I keep the module in <kbd>spec/support</kbd> and load it in my spec helper. You can adjust to your testing framework of choice. I hope that this tip will make your tests just a little faster. It shaves a solid minute off our rspec run at <a href="http://www.crunched.com">Crunched</a>.
