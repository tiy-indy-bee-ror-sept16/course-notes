#!/usr/bin/env ruby

require 'erb'
require_relative 'parse'

data = Parse.new.parse_data(ARGV[0])

puts ERB.new(File.read("report.erb")).result(binding)
