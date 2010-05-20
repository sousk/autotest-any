#!/usr/bin/env ruby

$LOAD_PATH << "#{ENV["TM_SUPPORT_PATH"]}/lib"
require "web_preview"

class SymfonyLimeTest
  
  attr_reader :root_dir, :test_file
  
  def initialize(args=ENV)
    @root_dir = ENV['TM_PROJECT_DIRECTORY']
    @test_file = ENV['TM_FILEPATH']
    @symfony = ENV['SYMFONY']
  end
  
  def test_file
    @test_file
  end
  
  def run
    Dir.chdir @root_dir do
      system "php #{@test_file}"
    end
  end
end

dt = SymfonyLimeTest.new

html_header "LimeTest - #{dt.test_file}"
puts "<pre><code>"

dt.run
puts "</code></pre>"
html_footer
