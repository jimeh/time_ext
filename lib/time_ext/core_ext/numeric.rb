require 'active_support/core_ext/numeric/time' unless Numeric.new.respond_to?(:seconds) # fixes rare loading issue

class Numeric
  alias :sec :seconds
  alias :min :minutes
end
