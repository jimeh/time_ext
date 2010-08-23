module TimeExt
  # Allows you to iterate over Time objects with #each and other methods almost as if it was an Array or Hash.
  module Iterations

    # Used by #each, #map_each and similar methods to iterate over ranges of time.
    def iterate(unit, options = {}, &block)
      options.reverse_merge!(:map_result => false, :beginning_of => false, :include_start => false, :include_end => true)
      if block_given?
        units = [:year, :month, :day, :hour, :min, :sec, :usec]
        parent_unit = units[units.index(unit)-1]
        if @of_the.nil?
          time = self.clone
          @until ||= (!parent_unit.nil?) ? self.send("#{parent_unit}s_since", 1) : self.send("#{unit}s_since", 1)
        else
          time = self.beginning_of(@of_the)
          @until = self.next(@of_the).beginning_of(@of_the)
          options.merge!(:beginning_of => true, :include_start => true, :include_end => false)
        end
        direction = (self < @until) ? :f : :b
        succ_method = (direction == :f) ? "next_#{unit}" : "prev_#{unit}"
        time = time.beginning_of(unit) if options[:beginning_of]
        time = time.send(succ_method) if !options[:include_start]
        @until = @until.prev(unit).end_of(unit) if !options[:include_end]
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

    # Used togeter with #each and other iteration methods to specify end of interation.
    def until(time, &block)
      time = time.to_time if time.is_a?(::Date)
      @until = time
      return call_chain(block) if block_given?
      self
    end
    alias :till :until

    # Used together with #each and other interation methods to specify start of iteration, and end will be current object.
    def from(time, &block)
      time = time.to_time if time.is_a?(::Date)
      method, args = @method_chain.pop if block_given?
      if !method.nil?
        time.until(self).send(method, *args, &block)
      else
        time.until(self)
      end
    end

    # Let's you iterate over every unit specified in the #each or #map call for the specified unit.
    def of_the(unit, &block)
      @of_the = unit
      return call_chain(block) if block_given?
      self
    end
    alias :of :of_the

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

    # Dynamically define convenience methods, like #each_hour instead of #each(:hour).
    [:year, :month, :day, :hour, :min, :sec].each do |unit|
      [:each, :beginning_of_each, :map_each, :map_beginning_of_each, :map].each do |method|
        define_method "#{method}_#{unit}" do |*args, &block|
          send(method, unit, *args, &block)
        end
        class_eval { alias :"#{method}_minute" :"#{method}_min" } if unit == :min
        class_eval { alias :"#{method}_second" :"#{method}_sec" } if unit == :sec
      end
      [:of_the, :of].each do |method|
        define_method "#{method}_#{unit}" do |*args, &block|
          send(method, unit, *args, &block)
        end
        class_eval { alias :"#{method}_minute" :"#{method}_min" } if unit == :min
        class_eval { alias :"#{method}_second" :"#{method}_sec" } if unit == :sec
      end
    end

  end
end