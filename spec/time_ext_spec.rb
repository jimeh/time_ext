require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TimeExt" do
  
  before(:each) do
    @now = Time.now
  end
  
  it "should have extra Time calculation methods" do
    @now.prev_second.should == @now - 1.second
    @now.prev_sec.should    == @now - 1.second
    @now.next_second.should == @now + 1.second
    @now.next_sec.should    == @now + 1.second
    
    @now.prev_minute.should == @now - 1.minute
    @now.prev_min.should    == @now - 1.minute
    @now.next_minute.should == @now + 1.minute
    @now.next_min.should    == @now + 1.minute
    
    @now.prev_hour.should == @now - 1.hour
    @now.next_hour.should == @now + 1.hour
    
    @now.prev_day.should      == @now - 1.day
    @now.next_day.should      == @now + 1.day
    @now.days_ago(1).should   == @now - 1.day
    @now.days_since(1).should == @now + 1.day
    
    @now.respond_to?(:floor).should be_true
    @now.respond_to?(:beginning_of).should be_true
    @now.respond_to?(:ceil).should be_true
    @now.respond_to?(:beginning_of_next).should be_true
  end

  it "should floor to seconds" do
    @now.floor(:sec).usec.should  == 0
    @now.floor(:sec).sec.should   == @now.sec
    @now.floor(:sec).min.should   == @now.min
    @now.floor(:sec).hour.should  == @now.hour
    @now.floor(:sec).day.should   == @now.day
    @now.floor(:sec).month.should == @now.month
    @now.floor(:sec).year.should  == @now.year
  end
  
  it "should floor to minutes" do
    @now.floor(:min).usec.should  == 0
    @now.floor(:min).sec.should   == 0
    @now.floor(:min).min.should   == @now.min
    @now.floor(:min).hour.should  == @now.hour
    @now.floor(:min).day.should   == @now.day
    @now.floor(:min).month.should == @now.month
    @now.floor(:min).year.should  == @now.year
  end
  
  it "should floor to hours" do
    @now.floor(:hour).usec.should  == 0
    @now.floor(:hour).sec.should   == 0
    @now.floor(:hour).min.should   == 0
    @now.floor(:hour).hour.should  == @now.hour
    @now.floor(:hour).day.should   == @now.day
    @now.floor(:hour).month.should == @now.month
    @now.floor(:hour).year.should  == @now.year
  end
  
  it "should floor to days" do
    @now.floor(:day).usec.should  == 0
    @now.floor(:day).sec.should   == 0
    @now.floor(:day).min.should   == 0
    @now.floor(:day).hour.should  == 0
    @now.floor(:day).day.should   == @now.day
    @now.floor(:day).month.should == @now.month
    @now.floor(:day).year.should  == @now.year
  end
  
  it "should floor to months" do
    @now.floor(:month).usec.should  == 0
    @now.floor(:month).sec.should   == 0
    @now.floor(:month).min.should   == 0
    @now.floor(:month).hour.should  == 0
    @now.floor(:month).day.should   == 1
    @now.floor(:month).month.should == @now.month
    @now.floor(:month).year.should  == @now.year
  end
  
  it "should floor to years" do
    @now.floor(:year).usec.should  == 0
    @now.floor(:year).sec.should   == 0
    @now.floor(:year).min.should   == 0
    @now.floor(:year).hour.should  == 0
    @now.floor(:year).day.should   == 1
    @now.floor(:year).month.should == 1
    @now.floor(:year).year.should  == @now.year
  end

end














