module TimeExt
  # Provides helper methods used by TimeExt::Calculations for backwards compatibility with ActiveSupport, and method chaining helpers for TimeExt::Iterations.
  module Support
    
    def days_into_week
      defined?(DAYS_INTO_WEEK) ? DAYS_INTO_WEEK : { :monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4, :saturday => 5, :sunday => 6 }
    end
  
    def common_year_days_in_month
      defined?(COMMON_YEAR_DAYS_IN_MONTH) ? COMMON_YEAR_DAYS_IN_MONTH : [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
    
    def add_to_chain(method, *args, &block)
      @method_chain ||= []
      @method_chain << [method.to_sym, args, block]
    end
    
    def call_chain(custom_block = nil, &block)
      method, args, iblock = @method_chain.pop
      return nil if method.nil?
      iblock = custom_block if !custom_block.nil?
      method, args, iblock = yield(method, args, iblock) if block_given?
      self.send(method, *args, &iblock)
    end
    
  end
end