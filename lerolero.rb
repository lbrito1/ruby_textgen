#!/usr/bin/env ruby
require './grammar'
require './rule'
require './codex'
require 'byebug'

@state = :idle
@grammar = Grammar.new
%w'rule dictionary'.each do |keyword|
  define_method(keyword) { @state = keyword.to_sym }
end

def codex *rulenames
  puts "Read codex with: #{rulenames.to_s}"
  @grammar.codex << (Codex.new rulenames)
end

def method_missing method, *args, &block
  case @state
  when :dictionary
    puts "Read dictionary with: #{method.to_s} #{args.to_s}"
    define_method(method) { args.sample }
  when :rule
    puts "Read rule with: #{method.to_s} #{args.to_s}"
    @grammar.rules[method.to_s] = (Rule.new args)
  when :idle
    puts "I can't do anything with #{method.to_s}"
  else
    super
  end
end  

load 'script.lero'
@grammar.generate