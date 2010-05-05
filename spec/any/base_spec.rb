require 'spec_helper'
require "autotest/any/base"

describe Autotest::Any::Base do
  let(:at) { Autotest::Any::Base.new }
  
  it { should be_a Autotest }
  it {
    tests = ['foo','bar']
    at.class.should_receive(:command).with(tests).and_return("cmd")
    at.make_test_cmd(tests).should == 'cmd'
  }
end
