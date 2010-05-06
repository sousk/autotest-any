require 'spec_helper'
require "autotest/symfony/base"

describe Autotest::Symfony::Base do
  let(:at) { Autotest::Symfony::Base.new }
  
  it { should be_a Autotest }
  
  context "pick plugins test" do
    it {
      at.find_plugin_test(
        'plugins/dinoUtilsPlugin/lib/ArrayUtil.php'
      ).should == 'plugins/dinoUtilsPlugin/test/lib/ArrayUtilTest.php'
    
      at.find_plugin_test(
        'plugins/Foo/lib/Bar.class.php'
      ).should == "plugins/Foo/test/lib/BarTest.php"
    }
  end
  
  context "local test" do
    it {
      at.find_local_unit_test(
        'lib/foo/Bar.class.php'
      ).should == "test/unit/lib/foo/BarTest.php"
    }
  end
end
