require 'spec_helper'
require "autotest/symfony/message"

describe Autotest::Symfony::Message do
  let(:msg) { class Foo; include Autotest::Symfony::Message; end.new }
  
  it {
    msg.should respond_to(:has_passed?)
  }
  
  it "should detect errors" do
    [
      "Notice: Undefined variable: ..php on line 106",
      "Warning: Missing argument 1 for ..php on line 100",
      "sfException: ..php on line 948"
    ].each {|err| 
      msg.has_passed?(err).should be_false
    }
  end
end
