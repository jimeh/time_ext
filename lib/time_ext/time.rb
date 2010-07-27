class Time
  
  # Returns a new Time representing the start of the unit specified (second by default)
  def floor(unit = :sec)
    self.send("beginning_of_#{unit}")
  end
  alias :beginning_of :floor
  alias :at_beginning_of :floor
  
  # Returns a new Time representing the start of the next unit specified (second by default)
  def ceil(unit = :sec)
    self.send("next_#{unit}").send("beginning_of_#{unit}")
  end
  alias :beginning_of_next :ceil
  alias :at_beginning_of_next :ceil
  
  # Short-hand for seconds_ago(1)
  def prev_second
    seconds_ago(1)
  end
  alias :prev_sec :prev_second

  # Short-hand for seconds_since(1)
  def next_second
    seconds_since(1)
  end
  alias :next_sec :next_second
  
  # Short-hand for minutes_ago(1)
  def prev_minute
    minutes_ago(1)
  end
  alias :prev_min :prev_minute

  # Short-hand for minutes_since(1)
  def next_minute
    minutes_since(1)
  end
  alias :next_min :next_minute
  
  # Short-hand for hours_ago(1)
  def prev_hour
    hours_ago(1)
  end

  # Short-hand for hours_since(1)
  def next_hour
    hours_since(1)
  end
  
  # Short-hand for days_ago(1)
  def prev_day
    days_ago(1)
  end

  # Short-hand for days_since(1)
  def next_day
    days_since(1)
  end

  # Returns a new Time representing the time a number of specified seconds ago
  def seconds_ago(seconds)
    advance(:seconds => -seconds)
  end
  alias :secs_ago :seconds_ago

  # Returns a new Time representing the time a number of specified seconds in the future
  def seconds_since(seconds)
    advance(:seconds => seconds)
  end
  alias :secs_since :seconds_since
  
  # Returns a new Time representing the time a number of specified minutes ago
  def minutes_ago(minutes)
    advance(:minutes => -minutes)
  end
  alias :mins_ago :minutes_ago

  # Returns a new Time representing the time a number of specified minutes in the future
  def minutes_since(minutes)
    advance(:minutes => minutes)
  end
  alias :mins_since :minutes_since
  
  # Returns a new Time representing the time a number of specified hours ago
  def hours_ago(hours)
    advance(:hours => -hours)
  end

  # Returns a new Time representing the time a number of specified hours in the future
  def hours_since(hours)
    advance(:hours => hours)
  end
  
  # Returns a new Time representing the time a number of specified days ago
  def days_ago(days)
    advance(:days => -days)
  end

  # Returns a new Time representing the time a number of specified days in the future
  def days_since(days)
    advance(:days => days)
  end
  
  # Returns a new Time representing the start of the hour (XX:00:00)
  def beginning_of_hour
    change(:min => 0, :sec => 0, :usec => 0)
  end
  alias :at_beginning_of_hour :beginning_of_hour

  # Returns a new Time representing the end of the hour, XX:59:59.999999 (.999999999 in ruby1.9)
  def end_of_hour
    change(:min => 59, :sec => 59, :usec => 999999.999)
  end
  
  # Returns a new Time representing the start of the minute (XX:XX:00)
  def beginning_of_minute
    change(:sec => 0, :usec => 0)
  end
  alias :beginning_of_min :beginning_of_minute
  alias :at_beginning_of_min :beginning_of_minute
  alias :at_beginning_of_minute :beginning_of_minute

  # Returns a new Time representing the end of the hour, XX:XX:59.999999 (.999999999 in ruby1.9)
  def end_of_minute
    change(:sec => 59, :usec => 999999.999)
  end
  alias :end_of_min :end_of_minute
  
  # Returns a new Time representing the start of the second, XX:XX:XX.000000 (.000000000 in ruby1.9)
  def beginning_of_second
    change(:usec => 0)
  end
  alias :beginning_of_sec :beginning_of_second
  alias :at_beginning_of_sec :beginning_of_second
  alias :at_beginning_of_second :beginning_of_second

  # Returns a new Time representing the end of the hour, XX:XX:XX.999999 (.999999999 in ruby1.9)
  def end_of_second
    change(:usec => 999999.999)
  end
  alias :end_of_sec :end_of_second
  
end
























