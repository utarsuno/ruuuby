#!/usr/bin/env ruby
# encoding: UTF-8

ENV['RUUUBY_F01']="b01|b03|b04{debug}"
#ENV['RUUUBY_F01']="b00"
#
require 'bundler/setup'
require 'ruuuby'

$ruuuby = 💎

using ::Ruuuby::Heuristics::ContextParsingCommandOutput

require_relative '../../lib/rubocop'

class String
  def as_color_green
    "\e[32m#{self}\e[0m"
  end
  def as_color_red
    "\e[31m#{self}\e[0m"
  end
end

ARGV.each { |arg|
  puts "\tARG!{#{arg}}"

  if arg.end_with?('.rb')
    if ::RuboCop.∃_offense?(arg)
      puts "path{#{arg}} failed syntax checks".as_color_red
      exit(2)
    end

    puts "path{#{arg}} passed syntax checks".as_color_green
    exit(0)
  else
    exit(0)
  end

  #file_contents = File.read(arg)
  #file_contents = file_contents.split($/)
  #puts "FIRST LINE IS: #{file_contents[0]}"
  #File.replace_expr_with!(arg, '# encoding: UTF-8', '# utf-8', 1)
}
