#!/usr/bin/env ruby
require './grammar'
require './dictionary'
require './rule'
require './codex'

@state = :idle

@grammar = Grammar.new

@keywords = ['rule', 'dictionary']
@keywords.each do |keyword|
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
    Dictionary.instance.add method.to_s, args
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