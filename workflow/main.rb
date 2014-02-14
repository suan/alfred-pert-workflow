#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
($LOAD_PATH << File.expand_path("..", __FILE__)).uniq!
require "bundle/bundler/setup"
require "alfred"

def calc_pert(std_devs, optimistic, most_likely, pessimistic)
  weighted_mean(optimistic.to_f, most_likely.to_f, pessimistic.to_f) +
    std_devs.to_f * std_dev(optimistic.to_f, pessimistic.to_f)
end

def weighted_mean(optimistic, most_likely, pessimistic)
  (optimistic + 4*most_likely + pessimistic) / 6.0
end

def std_dev(optimistic, pessimistic)
  (pessimistic - optimistic) / 6.0
end

def round_to_nearest_4th(num)
  (num * 4.0).round / 4.0
end

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback
  if ARGV.size == 4
    fb.add_item(:title => round_to_nearest_4th(calc_pert *ARGV).to_s)
  else
    fb.add_item(:title    => "Usage: pert <optimistic> <most likely> <pessimistic>",
                :subtitle => "Example: pert 2 3 5")
  end

  puts fb.to_xml
end
