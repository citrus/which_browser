Which Browser
-------------

Which Browser adds a few helper methods to a rack request so you can write cleaner browser-related logic.

For example, the age old battle against IE 5 & 6 can be handled like so:
  
    stylesheet_link_tag "ie" if request.ie_lt7?

And for a nice browser warning:

    - if request.ie6?
      IE6 makes the internet suck.
    - elsif request.ie5?
      You've got to be kidding me.
    

Or in your rails controller, decide which layout:

    render :layout => request.mobile_safari? ? 'mobile' : 'application' 



Here's some other popular helpers:

    request.ie?
    request.ie6?
    request.ie_lt6?
    request.ie_gte7?
    
    request.ipad?
    request.ipod?
    request.iphone?
    request.mobile_safari?


License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.