require File.dirname(__FILE__) + '/../spec_helper'

describe Autotest::PhpdoctestSymfony do
  it {
    klass.should respond_to(:run)
  }
  
  
  def klass
    Autotest::PhpdoctestSymfony
  end
end