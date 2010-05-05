require "autotest"

module Autotest::Any
  class Base < Autotest
    class << self
      def command=(cmd)
        raise "command= accepts only a proc object." unless cmd.kind_of?(Proc)
        @@command = cmd
      end
      
      def command(test_files)
        @@command.call test_files
      end
    end
    
    def make_test_cmd(test_files)
      cmd = []
      unless test_files.empty?
        cmd << self.class.command(test_files)
      end
      cmd.join(';') # an argument for system method
    end
  end
end
