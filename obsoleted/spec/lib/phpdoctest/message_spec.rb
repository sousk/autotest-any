require File.dirname(__FILE__) + '/../../spec_helper'

describe Autotest::Phpdoctest::Message do
  include Autotest::Phpdoctest::Message
  
  it "should report if the test has passed" do
    klass.should respond_to(:has_passed?)
    klass.has_passed?(result_of(:pass)).should be_true
    klass.has_passed?(result_of(:syntax_error)).should be_false
    klass.has_passed?(result_of(:fail)).should be_false
  end
  
  it "should summarize messages" do
    klass.should_receive(:filter_pass).and_return ['pass_ok']
    klass.summarize(:pass, 'hoge').should == 'pass_ok'
    
    klass.should_receive(:filter_fail).and_return ['fail_ok']
    klass.summarize(:fail, 'hoge').should == 'fail_ok'
    
    klass.summarize(:nothing, 'hoge').should =~ /nothing/
  end
  
  it "should summarize passed message" do
    msg = klass.filter_pass result_of(:pass).split("\n")
    msg = msg.join("\n")
    msg.should =~ /COVERAGE.*[0-9]+\%/
    msg.should =~ /tested [0-9] files/
  end
  
  it "should summarize syntax-error message" do
    msg = klass.filter_fail result_of(:syntax_error).split("\n")
    msg = msg.join("\n")
    # syntax error + msg + path + line
    msg.should =~ %r%(syntax err.*unexpected.*apps/frontend.*[0-9]+)%
  end
  
  def klass
    unless @k
      @k = mock()
      @k.class.send(:include, Autotest::Phpdoctest::Message)
    end
    @k
  end
  
  describe "failed message" do
    it "should include doctest's 'not' message" do
      message.should =~ /not ok/
    end
    
    it "should include file-name" do
      message.should =~ /Book.php/
    end
    
    def message
      @message ||= klass.filter_fail(result_of(:fail).split("\n")).join("\n")
    end
  end
  
end
