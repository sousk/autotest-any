require File.dirname(__FILE__) + '/../../spec_helper'

describe "autotest notification" do
  def runner
    @runner ||= RunnerTestClass.new
  end

  def autotest
    @autotest ||= mock(Autotest)
  end
  
  def klass
    Autotest::Phpdoctest::GrowlNotify
  end
  
  it "should turn on growl notification" do
    klass.should respond_to(:turn_on)
  end
  
  it "should run growl" do
    klass.should respond_to(:run_growl_proc)
    proc = klass.run_growl_proc
    autotest.should_receive(:results).and_return result_of(:pass)
    proc.call autotest
  end
end
