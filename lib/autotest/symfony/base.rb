require "autotest/any"

module Autotest::Symfony
  class Base < Autotest::Any::Base    
    
    def find_local_unit_test(source)
      t = source.gsub(/(\.class)?\.php$/, '')
      "test/unit/#{t}Test.php"
    end
    
    # find plugin's test file
    # e.g
    #   plugins/dinoUtilsPlugin/lib/ArrayUtil.php 
    #   => plugins/dinoUtilsPlugin/test/lib/ArrayUtil.php
    def find_plugin_test(source)
      # do not change the source text here (like a gsub!)
      t = source.gsub(/(\.class)?\.php$/, '')
      if t.match %r%^plugins/([^/]+)/(.+)%
        "plugins/#{$1}/test/#{$2}Test.php"
      else
        nil
      end
    end
    
  end
end
