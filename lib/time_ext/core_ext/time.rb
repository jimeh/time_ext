class Time
  include TimeExt::MethodChain
  include TimeExt::BackwardsCompatibility
  include TimeExt::Calculations
  include TimeExt::Iterations
  
  # Aliases to keep available method names to a standard pattern.
  alias :secs_ago :ago
  alias :seconds_ago :ago
  alias :secs_since :since
  alias :seconds_since :since
end
