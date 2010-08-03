module TimeExt
  # Provides helper methods used by TimeExt::Calculations for backwards compatibility with ActiveSupport.
  module BackwardsCompatibility
    
    def days_into_week
      defined?(DAYS_INTO_WEEK) ? DAYS_INTO_WEEK : { :monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4, :saturday => 5, :sunday => 6 }
    end
  
    def common_year_days_in_month
      defined?(COMMON_YEAR_DAYS_IN_MONTH) ? COMMON_YEAR_DAYS_IN_MONTH : [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
    
  end
end