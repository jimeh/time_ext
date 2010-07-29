class Time
  
  # Executes passed block for each unit of time specified
  def each(unit, &block)
    if block_given?
      @each_until ||= self.tomorrow #TODO should be next larger unit
      time = self.clone
      while time <= @each_until
        yield(time)
        time = time.send("next_#{unit}")
      end
      self
    else
      @method_chain ||= []
      @method_chain << [:each, [unit]]
      self
    end
  end
  alias :iterate :each
  alias :beginning_of_each :each
  
  # Executes passed block for each unit of time specified
  def map(unit, &block)
    if block_given?
      @each_until ||= self.tomorrow #TODO should be next larger unit
      time = self.clone
      result = []
      while time <= @each_until
        result << yield(time)
        time = time.send("next_#{unit}")
      end
      result
    else
      @method_chain ||= []
      @method_chain << [:map, [unit]]
      self
    end
  end
  alias :iterate :each
  
  # Used togeter with #each to specify end of interation
  def until(time, &block)
    time = time.to_time if time.is_a?(::Date)
    @each_until = time
    if block_given?
      method, args = @method_chain.pop
      self.send(method, *args, &block)
    else
      @method_chain ||= []
      @method_chain << [:until, [time]]
      self
    end
  end
  alias :till :until
  
end