require 'bundler/setup'
require 'pry'
Bundler.require
require_all 'lib'
ActiveRecord::Base

binding.pry