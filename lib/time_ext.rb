require 'rubygems'
require 'active_support'
require 'time_ext/method_chain'
require 'time_ext/core_ext/time/calculations'
require 'time_ext/core_ext/time/iterations'

module TimeExt
  
  module Base
    TIME_EXT_UNITS = [:year, :month, :day, :hour, :min, :sec, :usec]
  end
  
end