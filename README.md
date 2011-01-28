Which Browser
-------------

Which Browser adds a few helper methods to a rack request so you can write cleaner logic in your views.

For example, the age old battle against IE 5 & 6 can be handled like so:
  
    stylesheet_link_tag "ie" if request.old_ie?


Here's some other popular helpers:

    request.ie?
    request.ie6?
    request.ipad?
    request.ipod?
    request.iphone?
    request.mobile_safari?
    


License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.