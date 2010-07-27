# Ruby Time Extensions

This gem extends the abilities of Ruby's built-in Time class by building on top of what [ActiveSupport][as] already adds. Hence I must also warn that using this gem will load all of ActiveSupport at this time.


## Installation

    gem install time_ext


## Basic Usage

    require "time/ext"
    Time.now.round(:week)
    #=> Beginning of this week, or next week depending on which date is closest


## Documentation

A decently informative documentation is available [here][docs] on [rdoc.info][].

The main reason I created this gem was for the `round`, `floor`, and `ceil` methods. Each of them takes a unit argument, which can be one of the following: `:sec`, `:min`, `:hour`, `:day`, `:week`, `:month`, `:quarter`, and `:year`.


## To-Do

* Improve ReadMe file.
* Improve documentation.


## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


## License and Copyright

Copyright (c) 2010 Jim Myhrberg.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



[as]: http://as.rubyonrails.org/classes/ActiveSupport/CoreExtensions/Time/Calculations.html
[docs]: http://rdoc.info/projects/jimeh/time_ext
[rdoc.info]: http://rdoc.info/