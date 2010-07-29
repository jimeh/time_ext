require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Time Calculations" do
  
  before(:each) do
    @time = Time.local(2010, 8, 28, 15, 57, 17, 78430)
  end
  
  it "should have extra Time calculation methods" do
    @time.prev_second.should == @time - 1.second
    @time.prev_sec.should    == @time - 1.second
    @time.next_second.should == @time + 1.second
    @time.next_sec.should    == @time + 1.second
    
    @time.prev_minute.should == @time - 1.minute
    @time.prev_min.should    == @time - 1.minute
    @time.next_minute.should == @time + 1.minute
    @time.next_min.should    == @time + 1.minute
    
    @time.prev_hour.should == @time - 1.hour
    @time.next_hour.should == @time + 1.hour
    
    @time.prev_day.should      == @time - 1.day
    @time.next_day.should      == @time + 1.day
    @time.days_ago(1).should   == @time - 1.day
    @time.days_since(1).should == @time + 1.day
    
    @time.prev_week.day.should == 16
    
    @time.prev_quarter.day.should   == 1
    @time.prev_quarter.month.should == 4
    @time.next_quarter.day.should   == 1
    @time.next_quarter.month.should == 10
    
    @time.respond_to?(:floor).should                be_true
    @time.respond_to?(:beginning_of).should         be_true
    @time.respond_to?(:ceil).should                 be_true
    @time.respond_to?(:beginning_of_next).should    be_true
    @time.respond_to?(:round).should                be_true
    @time.respond_to?(:beginning_of_closest).should be_true
  end

  it "should floor and ceil to seconds" do
    floor = @time.floor(:sec)
    floor.usec.should  == 0
    floor.sec.should   == @time.sec
    floor.min.should   == @time.min
    floor.hour.should  == @time.hour
    floor.day.should   == @time.day
    floor.month.should == @time.month
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:sec)
    ceil.usec.should  == 0
    ceil.sec.should   == @time.sec + 1
    ceil.min.should   == @time.min
    ceil.hour.should  == @time.hour
    ceil.day.should   == @time.day
    ceil.month.should == @time.month
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to minutes" do
    floor = @time.floor(:min)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == @time.min
    floor.hour.should  == @time.hour
    floor.day.should   == @time.day
    floor.month.should == @time.month
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:min)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == @time.min + 1
    ceil.hour.should  == @time.hour
    ceil.day.should   == @time.day
    ceil.month.should == @time.month
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to hours" do
    floor = @time.floor(:hour)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == 0
    floor.hour.should  == @time.hour
    floor.day.should   == @time.day
    floor.month.should == @time.month
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:hour)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == 0
    ceil.hour.should  == @time.hour + 1
    ceil.day.should   == @time.day
    ceil.month.should == @time.month
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to days" do
    floor = @time.floor(:day)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == 0
    floor.hour.should  == 0
    floor.day.should   == @time.day
    floor.month.should == @time.month
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:day)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == 0
    ceil.hour.should  == 0
    ceil.day.should   == @time.day + 1
    ceil.month.should == @time.month
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to weeks" do
    floor = @time.floor(:week)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == 0
    floor.hour.should  == 0
    floor.day.should   == 23
    floor.month.should == @time.month
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:week)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == 0
    ceil.hour.should  == 0
    ceil.day.should   == 30
    ceil.month.should == @time.month
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to months" do
    floor = @time.floor(:month)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == 0
    floor.hour.should  == 0
    floor.day.should   == 1
    floor.month.should == @time.month
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:month)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == 0
    ceil.hour.should  == 0
    ceil.day.should   == 1
    ceil.month.should == @time.month + 1
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to quarters" do
    floor = @time.floor(:quarter)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == 0
    floor.hour.should  == 0
    floor.day.should   == 1
    floor.month.should == 7
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:quarter)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == 0
    ceil.hour.should  == 0
    ceil.day.should   == 1
    ceil.month.should == 10
    ceil.year.should  == @time.year
  end
  
  it "should floor and ceil to years" do
    floor = @time.floor(:year)
    floor.usec.should  == 0
    floor.sec.should   == 0
    floor.min.should   == 0
    floor.hour.should  == 0
    floor.day.should   == 1
    floor.month.should == 1
    floor.year.should  == @time.year
    
    ceil = @time.ceil(:year)
    ceil.usec.should  == 0
    ceil.sec.should   == 0
    ceil.min.should   == 0
    ceil.hour.should  == 0
    ceil.day.should   == 1
    ceil.month.should == 1
    ceil.year.should  == @time.year + 1
  end

  it "should round to seconds" do
    round = Time.local(2010, 8, 28, 15, 57, 17, 999999.999).round(:sec)
    round.usec.should == 0
    round.sec.should  == 18
    
    round = Time.local(2010, 8, 28, 15, 57, 17, 111111.111).round(:sec)
    round.usec.should == 0
    round.sec.should  == 17
  end
  
  it "should round to minutes" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:min)
    round.sec.should == 0
    round.min.should == 58
    
    round = Time.local(2010, 8, 28, 15, 57, 17, 999999.999).round(:min)
    round.sec.should == 0
    round.min.should == 57
  end
  
  it "should round to hours" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:hour)
    round.min.should  == 0
    round.hour.should == 16
    
    round = Time.local(2010, 8, 28, 15, 17, 47, 999999.999).round(:hour)
    round.min.should  == 0
    round.hour.should == 15
  end
  
  it "should round to days" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:day)
    round.hour.should == 0
    round.day.should  == 29
    
    round = Time.local(2010, 8, 28, 11, 57, 47, 999999.999).round(:day)
    round.hour.should == 0
    round.day.should  == 28
  end
  
  it "should round to weeks" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:week)
    round.hour.should == 0
    round.day.should  == 30
    
    round = Time.local(2010, 8, 25, 15, 57, 47, 999999.999).round(:week)
    round.hour.should == 0
    round.day.should  == 23
  end
  
  it "should round to months" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:month)
    round.day.should   == 1
    round.month.should == 9
    
    round = Time.local(2010, 8, 8, 15, 57, 47, 999999.999).round(:month)
    round.day.should   == 1
    round.month.should == 8
  end
  
  it "should round to quarters" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:quarter)
    round.hour.should  == 0
    round.day.should   == 1
    round.month.should == 10
    
    round = Time.local(2010, 8, 8, 15, 57, 47, 999999.999).round(:quarter)
    round.hour.should  == 0
    round.day.should   == 1
    round.month.should == 7
  end
  
  it "should round to years" do
    round = Time.local(2010, 8, 28, 15, 57, 47, 999999.999).round(:year)
    round.month.should == 1
    round.year.should  == 2011
    
    round = Time.local(2010, 4, 28, 15, 57, 47, 999999.999).round(:year)
    round.month.should == 1
    round.year.should  == 2010
  end
  
end
