# Which Browser [![Build Status](https://secure.travis-ci.org/citrus/which_browser.png)](http://travis-ci.org/citrus/which_browser)

### Check for user agents like a boss!


Which Browser adds a few helper methods to a rack request so you can write cleaner browser-related logic.

For example, the age old battle against IE 5 & 6 can be handled like so:
  
    stylesheet_link_tag "ie" if request.ie_lt7?


And for a nice browser warning:

    - if request.ie6?
      IE6 makes the internet suck.
    - elsif request.ie5?
      You've got to be kidding me.
    

Or in your rails controller, decide which layout:

    render :layout => request.mobile? ? 'mobile' : 'application' 


Here's some other popular helpers:

    request.ie?
    request.ie6?
    request.ie_lt6?
    request.ie_gte7?
    
    request.mobile?
    request.ipad?
    request.ipod?
    request.iphone?
    request.mobile_safari?


Installation
------------

As usual, just use the `gem install` command:

    (sudo) gem install which_browser
    
Or add which_browser as a gem in your Gemfile:

    gem 'which_browser', '>= 0.2.0' 

Then run `bundle install`


Testing
-------

Tests can be run with:

    git clone git://github.com/citrus/which_browser.git
    cd which_browser
    bundle
    bundle exec rake

There is also a sinatra app in `test/dummy` for a demo and real-life testing. Install sinatra (`gem install sinatra`) if you don't have it, then run:

    cd which_browser
    ruby test/dummy/app.rb 

Now open your browser to [http://localhost:4567](http://localhost:4567) and fiddle with your user agent.


License
-------

Copyright (c) 2011 Spencer Steffen and Citrus, released under the New BSD License All rights reserved.
