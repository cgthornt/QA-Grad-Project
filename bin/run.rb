#!/usr/bin/env ruby
# Runs test cases!

# This loads all of our gems and allows us to access classes / modules in the lib dir
require './' + File.join(File.dirname(__FILE__), '..', 'lib', 'include.rb')


b = Browser.new
b.go :root