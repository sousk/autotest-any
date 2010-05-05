require "autotest/any/message"

module Autotest::Symfony
  module Message
    include Autotest::Any::Message
    def has_passed?(o)
      # doctest says 'fine' with errors, so watch errors
      o.match(Regexp.union(
        /Parse error: syntax error, ([^\n]+)\n/,
        /Failed test/,
        /Fatal error/,
        /Warning:.*on line [0-9]+/,
        /Notice:.*on line [0-9]+/
      )) ? false : true
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
      cov, num = '', 0
      o.each do |line|
        cov = $~.to_s if line.match(/TOTAL.*COVERAGE([^\n]+)/)
        num += 1 if line.match(/\#\s+file:\s*/)
      end
      ['Pass:', cov, "tested #{num} files"]
    end
    
    def filter_fail(o)
      report = []
      o.each do |line|
        # syntax error
        if line.match(/Parse error: syntax error, (.+) in (.+) on line ([0-9]+)/)
          _msg, _path, _line = $~.captures
          _path = _path.match(/\/(apps\/.+)/) ? $~.captures.to_s : _path
          report << "syntax err: #{_msg} @#{_path}:#{_line}"
        end
        # not message
        report << $~.to_s if line.match(/^\s*not.*$/)
        # file path
        # Failed test (./cache/frontend/test/sfDocTestPlugin/tests/lib/model/Book.php at line 27)
        report << "#{$1} line:#{$2}" if line.match(%r%Failed test.*\(.*sfDocTestPlugin/tests/([^\s]+) at line ([0-9]+)\)%)
      end
      ['Fail:', report]
    end
  end
end
