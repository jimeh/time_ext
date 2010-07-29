class Time
  include TimeExt::MethodChain
  
  # Used by #each, #map_each and similar methods to iterate over ranges of time.
  def iterate(unit, options = {}, &block)
    options.reverse_merge!(:map_result => false, :beginning_of => false, :include_start => false)
    if block_given?
      units = [:year, :month, :day, :hour, :min, :sec, :usec]
      parent_unit = units[units.index(unit)-1]
      @until ||= (!parent_unit.nil?) ? self.send("#{parent_unit}s_since", 1) : self.send("#{unit}s_since", 1)
      time = self.clone
      direction = (self < @until) ? :f : :b
      succ_method = (direction == :f) ? "next_#{unit}" : "prev_#{unit}"
      time = time.beginning_of(unit) if options[:beginning_of]
      time = time.send(succ_method) if !options[:include_start]
      results = []
      while (direction == :f && time <= @until) || (direction == :b && time >= @until)
        options[:map_result] ? results << yield(time) : yield(time)
        time = time.send(succ_method)
      end
      options[:map_result] ? results : self
    else
      add_to_chain(:iterate, unit, options)
      self
    end
  end
  
  # Executes passed block for each "unit" of time specified, with a new time object for each interval passed to the block.
  def each(unit, options = {}, &block)
    iterate(unit, options.merge(:map_result => false), &block)
  end
  
  # Executes passed block for each "unit" of time specified, with a new time object set to the beginning of "unit" for each interval passed to the block.
  def beginning_of_each(unit, options = {}, &block)
    iterate(unit, options.merge(:map_result => false, :beginning_of => true), &block)
  end
  
  # Executes passed block for each "unit" of time specified, returning an array with the return values from the passed block.
  def map_each(unit, options = {}, &block)
    iterate(unit, options.merge(:map_result => true), &block)
  end
  
  # Executes passed block for each "unit" of time specified, returning an array with the return values from passed block. Additionally the time object passed into the block is set to the beginning of specified "unit".
  def map_beginning_of_each(unit, options = {}, &block)
    iterate(unit, options.merge(:map_result => true, :beginning_of => true), &block)
  end
  
  # Used togeter with #each to specify end of interation.
  def until(time, &block)
    time = time.to_time if time.is_a?(::Date)
    @until = time
    if block_given?
      call_chain(block)
    else
      add_to_chain(:until, time)
      self
    end
  end
  alias :till :until
  
  # Dynamically define convenience methods, like #each_hour instead of #each(:hour).
  [:year, :month, :day, :hour, :min, :minute, :sec, :second].each do |unit|
    [:each, :beginning_of_each, :map_each, :map_beginning_of_each].each do |method|
      called_unit = (unit == :minute) ? :min : (unit == :second) ? :sec : unit
      define_method "#{method}_#{unit}" do |*args, &block|
        send(method, called_unit, *args, &block)
      end
    end
  end
  
end