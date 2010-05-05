require File.dirname(__FILE__) + '/../../spec_helper'

describe Autotest::Phpdoctest::Base do
  it "should extend Autotest" do
    klass.should respond_to(:run)
  end
  
  # it "should turn growl on" do
  #   klass.should respond_to(:growl_on)
  #   
  #   growl.should_receive(:turn_on)
  #   klass.growl_on
  # end
  
  def klass
    Autotest::Phpdoctest::Base
  end
  
  def growl
    Autotest::Phpdoctest::GrowlNotify
  end
end