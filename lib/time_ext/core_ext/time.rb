# encoding: utf-8

# Support both Active Support 2.x and 3.x, and also address rare loading
# issue.
require 'active_support/time' unless Time.respond_to?(:days_in_month)
require 'active_support/core_ext/time/calculations' unless Time.new.respond_to?(:ago)

class Time
  # Include TimeExt modules into Time object.
  include TimeExt::Calculations
  include TimeExt::Iterations
  
  # Aliases to keep available method names to a standard pattern.
  alias :secs_ago :ago
  alias :seconds_ago :ago
  alias :secs_since :since
  alias :seconds_since :since
end
