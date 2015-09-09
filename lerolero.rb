#!/usr/bin/env ruby
require './grammar'
require './rule'
require './codex'
require 'byebug'

@state = :idle
@grammar = Grammar.new

def dictionary
  @state = :dictionary
end

def rule *args
  puts "Read rule: #{args.to_s}"
  @grammar.rules[args.first.to_s] = (Rule.new args.first.to_s)
  @last_rule = args.first.to_s
  define_method(args.first.to_s) { @grammar.rules[args.first.to_s] }
  @state = :rule
end

def codex *rulenames
  puts "Read codex with: #{rulenames.to_s}"
  @grammar.codex << (Codex.new rulenames)
end

def opt *args
  puts "Read option for rule #{@last_rule}: #{args.to_s}"
  @grammar.rules[@last_rule].options << args
end 

def method_missing method, *args, &block
  case @state
  when :dictionary
    puts "Read dictionary with: #{method.to_s} #{args.to_s}"
    define_method(method) do
      args[(rand*args.size).to_i]
    end
  when :idle
    puts "I can't do anything with #{method.to_s}"
  else
    super
  end
end  

load 'script.lero'
@grammar.generate