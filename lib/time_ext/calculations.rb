# encoding: utf-8

module TimeExt
  # Adds an even greater extent of calculation methods on top of those already
  # provided by ActiveSupport.
  module Calculations
    
    #### Public Methods
    
    # Returns a new Time representing the start of the unit specified (second
    # by default).
    def floor(unit = :sec)
      self.send("beginning_of_#{unit}")
    end
    alias :beginning_of :floor
    alias :at_beginning_of :floor
    
    # Returns a new Time representing the start of the next unit specified (second by default).
    def ceil(unit = :sec)
      self.send("next_#{unit}").send("beginning_of_#{unit}")
    end
    alias :beginning_of_next :ceil
    alias :at_beginning_of_next :ceil
    
    # Returns a new Time representing the start of the current or next unit
    # specified (second by default) depending which is closest
    def round(unit = :sec)
      next_unit = self.ceil(unit)
      this_unit = self.floor(unit)
      (self - this_unit) < (next_unit - self) ? this_unit : next_unit
    end
    alias :beginning_of_closest :round
    
    # Returns a new Time representing the previoius unit specified (defaults
    # to second).
    def prev(unit = :sec)
      send("prev_#{unit}")
    end
    
    # Returns a new Time representing the next unit specified (defaults to
    # second).
    def next(unit = :sec)
      send("next_#{unit}")
    end
    
    # Short-hand for seconds_ago(1).
    def prev_second
      seconds_ago(1)
    end
    alias :prev_sec :prev_second
    
    # Short-hand for seconds_since(1).
    def next_second
      seconds_since(1)
    end
    alias :next_sec :next_second
    
    # Short-hand for minutes_ago(1).
    def prev_minute
      minutes_ago(1)
    end
    alias :prev_min :prev_minute
    
    # Short-hand for minutes_since(1).
    def next_minute
      minutes_since(1)
    end
    alias :next_min :next_minute
    
    # Short-hand for hours_ago(1).
    def prev_hour
      hours_ago(1)
    end
    
    # Short-hand for hours_since(1).
    def next_hour
      hours_since(1)
    end
    
    # Short-hand for days_ago(1).
    def prev_day
      days_ago(1)
    end
    
    # Short-hand for days_since(1).
    def next_day
      days_since(1)
    end
    
    # Returns a new Time representing the start of the given day in the
    # previous week (default is Monday).
    def prev_week(day = :monday)
      weeks_ago(1).beginning_of_week.since(days_into_week[day].day).change(:hour => 0)
    end
    
    # Short-hand for quarters_since(1).beginning_of_quarter.
    def next_quarter
      quarters_since(1).beginning_of_quarter
    end
    
    # Short-hand for quarters_ago(1).beginning_of_quarter.
    def prev_quarter
      quarters_ago(1).beginning_of_quarter
    end
    
    # Returns a new Time representing the time a number of specified minutes
    # ago.
    def minutes_ago(minutes)
      ago(minutes.minutes)
    end
    alias :mins_ago :minutes_ago
    
    # Returns a new Time representing the time a number of specified minutes
    # in the future.
    def minutes_since(minutes)
      since(minutes.minutes)
    end
    alias :mins_since :minutes_since
    
    # Returns a new Time representing the time a number of specified hours
    # ago.
    def hours_ago(hours)
      ago(hours.hours)
    end
    
    # Returns a new Time representing the time a number of specified hours in
    # the future.
    def hours_since(hours)
      since(hours.hours)
    end
    
    # Returns a new Time representing the time a number of specified days ago.
    def days_ago(days)
      ago(days.days)
    end
    
    # Returns a new Time representing the time a number of specified days in
    # the future.
    def days_since(days)
      since(days.days)
    end
    
    # Returns a new Time representing the time a number of specified weeks
    # ago.
    def weeks_ago(weeks)
      ago(weeks.weeks)
    end
    
    # Returns a new Time representing the time a number of specified weeks in
    # the future.
    def weeks_since(weeks)
      since(weeks.weeks)
    end
    
    # Returns a new Time representing the time a number of specified quarters
    # (3 months) ago.
    def quarters_ago(quarters)
      ago((quarters * 3).months)
    end
    
    # Returns a new Time representing the time a number of specified quarters
    # (3 months) in the future.
    def quarters_since(quarters)
      since((quarters * 3).months)
    end
    
    # Returns a new Time representing the end of the unit specified (defaults
    # to second).
    def end_of(unit = :sec)
      send("end_of_#{unit}")
    end
    
    # Returns a new Time representing the start of the second, XX:XX:XX.000000
    # (.000000000 in ruby1.9).
    def beginning_of_second
      change(:usec => 0)
    end
    alias :beginning_of_sec :beginning_of_second
    alias :at_beginning_of_sec :beginning_of_second
    alias :at_beginning_of_second :beginning_of_second
    
    # Returns a new Time representing the end of the second, XX:XX:XX.999999
    # (.999999999 in ruby1.9).
    def end_of_second
      change(:usec => 999999.999)
    end
    alias :end_of_sec :end_of_second
    
    # Returns a new Time representing the start of the minute (XX:XX:00).
    def beginning_of_minute
      change(:sec => 0, :usec => 0)
    end
    alias :beginning_of_min :beginning_of_minute
    alias :at_beginning_of_min :beginning_of_minute
    alias :at_beginning_of_minute :beginning_of_minute
    
    # Returns a new Time representing the end of the hour, XX:XX:59.999999 (.999999999 in ruby1.9).
    def end_of_minute
      change(:sec => 59, :usec => 999999.999)
    end
    alias :end_of_min :end_of_minute
    
    # Returns a new Time representing the start of the hour (XX:00:00).
    def beginning_of_hour
      change(:min => 0, :sec => 0, :usec => 0)
    end
    alias :at_beginning_of_hour :beginning_of_hour
    
    # Returns a new Time representing the end of the hour, XX:59:59.999999
    # (.999999999 in ruby1.9).
    def end_of_hour
      change(:min => 59, :sec => 59, :usec => 999999.999)
    end
    
    private
    
    #### Private Helper Methods
    
    # Definitive list of days in the week.
    def days_into_week
      defined?(DAYS_INTO_WEEK) ? DAYS_INTO_WEEK : { :monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4, :saturday => 5, :sunday => 6 }
    end
    
    # Definitive list of days for each month of the year.
    def common_year_days_in_month
      defined?(COMMON_YEAR_DAYS_IN_MONTH) ? COMMON_YEAR_DAYS_IN_MONTH : [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
  
  end
end