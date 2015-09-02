#!/usr/bin/env ruby
require_relative 'grammar'
require_relative 'dictionary'
require_relative 'rule'
require_relative 'codex'

@grammar = Grammar.new

def dictionary
  @state = :dictionary
end

def rule
  @state = :rule
end

def codex *rulenames
  puts "Read codex with: #{rulenames.to_s}"
  @grammar.codex << (Codex.new rulenames)
end

def method_missing method, *args, &block
  @state ||= :idle
  case @state
  when :dictionary
    puts "Read dictionary with: #{method.to_s} #{args.to_s}"
    Dictionary.instance.add method.to_s, args
  when :rule
    puts "Read rule with: #{method.to_s} #{args.to_s}"
    @grammar.rules[method.to_s] = (Rule.new args)
  when :idle
  else
    puts "Boom! Something went wrong. I don't know what to do with #{@state.to_s}."
  end
end  

load 'script.lero'
@grammar.generate