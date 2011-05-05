require 'active_support'
require 'active_support/time' unless Time.respond_to?(:days_in_month) # support both Active Support 2.x and 3.x
require 'active_support/core_ext/time/calculations' unless Time.new.respond_to?(:ago) # fixes rare loading issue

class Time
  include TimeExt::Support
  include TimeExt::Calculations
  include TimeExt::Iterations
  
  # Aliases to keep available method names to a standard pattern.
  alias :secs_ago :ago
  alias :seconds_ago :ago
  alias :secs_since :since
  alias :seconds_since :since
end
