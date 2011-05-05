# encoding: utf-8

require 'rubygems'
require 'active_support'
require 'time_ext/version'

# [Calculation][ca] methods such as `#floor`, `#ceil`, `#round`,
# `#prev_week` and many more, adding on top of the defaults present in
# ActiveSupport.
# [ca]: time_ext/calculations.html
require 'time_ext/calculations'

# [Iteration][it] methods allowing the use of `#each`, `#map_each` and more on
# Time objects similar to how you loop over an Array of items.
# [it]: time_ext/iterations.html
require 'time_ext/iterations'

# Core extention of [Time][ti] class to load in [Calculation][ca] and
# [Iteration][it] modules.
# [ti]: time_ext/core_ext/time.html
require 'time_ext/core_ext/time'

# Core extention of [Numeric][nu] class to set a couple of required aliases.
# [nu]: time_ext/core_ext/numeric.html
require 'time_ext/core_ext/numeric'
