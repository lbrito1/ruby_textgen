#!/usr/bin/env ruby
require './grammar'
require './rule'
require 'byebug'

@state = :idle
@grammar = Grammar.new

def dictionary
  @state = :dictionary
end

def grammar args
  @grammar.generate args
end

def rule *args
  puts "Read rule: #{args.to_s}"
  @last_rule = args.first.to_s
  @grammar.rules[@last_rule] = (Rule.new @last_rule)
  define_method(@last_rule) { @grammar.rules[@last_rule] }
  @state = :rule
end

def opt *args
  if @state == :rule
    puts "Read option for rule #{@last_rule}: #{args.to_s}"
    @grammar.rules[@last_rule].options << args
  end
end 

def method_missing method, *args, &block
  if @state == :dictionary
    puts "Read dictionary with: #{method.to_s} #{args.to_s}"
    define_method(method) { args[(rand*args.size).to_i] }
  else
    super
  end
end  

load 'script.lero'