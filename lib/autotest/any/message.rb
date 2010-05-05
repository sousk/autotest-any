require "autotest"

module Autotest::Any
  module Message
    # override me
    def has_passed?(o)
      false
    end
    
    def summarize(result, output)
      o = output.split("\n")
      res = case result.to_sym
        when :fail then filter_fail(o)
        when :pass then filter_pass(o)
        else ["nothing to summarize for #{result}"]
      end
      res.flatten.join "\n"
    end
    
    def filter_pass(o)
      ['Pass:', "override me :)"]
    end
    
    def filter_fail(o)
      ['Fail:', "override me :("]
    end
  end
end
