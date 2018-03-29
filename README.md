# Ruby Time Extensions
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fjimeh%2Ftime_ext.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fjimeh%2Ftime_ext?ref=badge_shield)


This gem extends the abilities of Ruby's built-in Time class by building on top of what [ActiveSupport][as] already adds. Hence I must also warn that using this gem will load all of ActiveSupport at this time.


## Installation

    gem install time_ext


## Basic Usage

### Pure Ruby

    require "time/ext" # or "time_ext"
    Time.utc(2010, 6, 19).round(:month) #=> Thu Jul 01 00:00:00 UTC 2010
    #=> Beginning of this month, or beginning of next month depending on which is closest
    Time.now.each_hour.until(6.hours.from_now) { |t| puts t.to_s }
    #=> Prints the time at one hour interals from now till 6 hours from now

### Rails 2.x

    config.gem "time_ext"

### Rails 3.x

    gem "time_ext"


## Documentation

Complete class and method documentation is available [here][docs] on [rdoc.info][].

### Calculations

ActiveSupport includes some handy `#beginning_of_*` and `#end_of_*` methods among others for year, month, week, and day. TimeExt adds the same methods for quarter (3 months), hour, minute, and second. Additionally it also adds a set of familiar math methods, `#floor`, `#ceil`, and `#round`. Each of them takes a unit argument (day, month, etc.), and goes about it's operation to that unit type.

### Iterations

You can easily iterate over specific units of time with the `#each`, `#beginning_of_each`, `#map_each`, and `#map_beginning_of_each` methods. Each method takes a unit input, just like the `#floor` method for example. But the iteration methods also have dynamic unit methods, like so:

    time = Time.local(2010, 07, 10)
    time.map_each(:hour).until(time + 6.hours) { |t| t.hour } #=> [1, 2, 3, 4, 5, 6]
    time.map_each_hour.until(time + 6.hours) { |t| t.hour } #=> [1, 2, 3, 4, 5, 6]
    
The `#until` method defines when to stop the iteration. You can also use the `#from` method, which then iterates from the time passed into `#from` till the time of the object you're calling each on. If don't specify a end/start time, it'll assume you want all units within it's scope. Or in less gibberish, calling `#each_hour` will iterate every hour for a whole day, or 24 hours. If you're iterating by the minute, it'll stop after an hour.

Here's a couple of more examples:

    time.map_each_hour.until(time + 6.hours) { |t| t.hour } #=> [1, 2, 3, 4, 5, 6]
    time.until(time + 6.hours).map_each_hour { |t| t.hour } #=> [1, 2, 3, 4, 5, 6]
    (time + 6.hours).map_each_hour.from(time) { |t| t.hour } #=> [1, 2, 3, 4, 5, 6]
    (time + 6.hours).from(time).map_each_hour { |t| t.hour } #=> [1, 2, 3, 4, 5, 6]

I recommend you read the complete class [documentation][docs] for the Time object to see all the new methods available.


## To-Do

* Some cleaner code.
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
[docs]: http://rdoc.info/gems/time_ext/frames
[rdoc.info]: http://rdoc.info/

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fjimeh%2Ftime_ext.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fjimeh%2Ftime_ext?ref=badge_large)