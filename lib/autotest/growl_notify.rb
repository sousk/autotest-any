require "growl" # http://github.com/visionmedia/growl

class Autotest::GrowlNotify
  
  # AUTOTEST_IMAGE_ROOT = "~/.autotest_images"
  
  class << self
        
    include Growl
    # include Autotest::Phpdoctest::Message
    
    def turn_on
      Autotest.add_hook :ran_command, &self.run_growl_proc
    end
    
    def run_growl_proc
      lambda do |at|
        # at.class gets Autotest::YourStyle
        output = [at.results].flatten.join("\n")
        
        if has_passed? output
          notify_ok summarize(:pass, output)
        else
          notify_error summarize(:fail, output)
        end
      end
    end
  end
  
  self.turn_on
end
