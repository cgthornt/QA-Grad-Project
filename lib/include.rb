# Include this file first!
require 'rubygems'
require 'bundler'
require 'active_support/all'

# Require everything in Gemfile
Bundler.require :default

# Here just in case
module Include; end



# Autoload the lib dir and tests dir
ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__))