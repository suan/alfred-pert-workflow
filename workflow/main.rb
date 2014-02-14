#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
($LOAD_PATH << File.expand_path("..", __FILE__)).uniq!
require "bundle/bundler/setup"
require "alfred"

def calc_pert(optimistic, most_likely, pessimistic)
  (optimistic.to_f + 4*most_likely.to_f + pessimistic.to_f) / 6.0
end

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback
  if ARGV.size == 3
    fb.add_item(:title => sprintf('%.2f', calc_pert(*ARGV)))
  else
    fb.add_item(:title    => "Usage: pert <optimistic> <most likely> <pessimistic>",
                :subtitle => "Example: pert 2 3 5")
  end

  puts fb.to_xml
end
