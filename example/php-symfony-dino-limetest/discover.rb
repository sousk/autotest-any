$:.unshift 'dir_to/autotest-any/lib'
require "autotest/symfony"
require "autotest/symfony/message"
require "autotest/growl_notify"

class Autotest::GrowlNotify
  AUTOTEST_IMAGE_ROOT = "~/.autotest_images"
  class << self
    include Autotest::Symfony::Message
  end
end

class Autotest::DinolimetestPhp < Autotest::Symfony::Base
end
Autotest::DinolimetestPhp.command = lambda do |test_files|
  cmd = test_files.collect{|t| "php #{t}" }.join(' && ')
end

# puts "debug: command output"
# p Autotest::DinolimetestPhp.command ['foo', 'bar']
