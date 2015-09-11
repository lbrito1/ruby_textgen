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
  verbose "Read rule: #{args.to_s}"
  @last_rule = args.first.to_s
  @grammar.rules[@last_rule] = (Rule.new @last_rule)
  define_method(args.first.to_s) { @grammar.rules[args.first.to_s] }
  @state = :rule
end

def opt *args
  if @state == :rule
    verbose "Read option for rule #{@last_rule}: #{args.to_s}"
    @grammar.rules[@last_rule].options << args
  end
end 

def method_missing method, *args, &block
  if @state == :dictionary
    verbose "Read dictionary with: #{method.to_s} #{args.to_s}"
    @grammar.add_words(method, args)
    define_method(method.to_s) { @grammar.words[method.to_s] }
  else
    super
  end
end  

if ARGV.size == 0
  puts "You forgot to pass an argument.\nUsage: ruby lerolero.rb myscript.lero [-V]"
else
  define_method('verbose') { |arg| puts arg if ARGV[1] && ARGV[1] == '-V' } 
  load ARGV[0]
end