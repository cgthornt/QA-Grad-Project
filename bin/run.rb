#!/usr/bin/env ruby
# Runs test cases!

# This loads all of our gems and allows us to access classes / modules in the lib dir
require './' + File.join(File.dirname(__FILE__), '..', 'include.rb')

# Auto-run tests
require 'minitest/autorun'

Dir[File.join(Settings::TEST_DIR, '**', '*.rb')].each do |test|
  require test
end
