# encoding: utf-8

# Support both Active Support 2.x and 3.x, and also addresses rare loading
# issue.
require 'active_support/core_ext/numeric/time' unless Numeric.new.respond_to?(:seconds)

class Numeric
  alias :sec :seconds
  alias :min :minutes
end
