require 'rubygems'
require 'active_support'

# support both Active Support 2.x and 3.x
require 'active_support/time' if !Time.respond_to?(:days_in_month)

require 'time_ext/calculations'
require 'time_ext/iterations'
require 'time_ext/support'
require 'time_ext/core_ext/time'
require 'time_ext/core_ext/numeric'
