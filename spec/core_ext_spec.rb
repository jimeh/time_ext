require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Core Extensions" do
  
  it "should alias Numeric class methods" do
    number = 1
    number.sec.should == number.second
    number.min.should == number.minute
  end
  
  it "should alias Time instance methods" do
    time = Time.now
    time.secs_ago(10).should == time.ago(10)
    time.seconds_ago(10).should == time.ago(10)
    time.secs_since(10).should == time.since(10)
    time.seconds_since(10).should == time.since(10)
  end

end