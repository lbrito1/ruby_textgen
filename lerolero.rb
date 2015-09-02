#!/usr/bin/env ruby
#
require_relative 'grammar'
require_relative 'dictionary'
require_relative 'rule'
require_relative 'codex'

@grammar = Grammar.new

def dictionary key, *values
  puts "Read dictionary with: #{key} #{values.to_s}"
  Dictionary.instance.add key, values
end

def rule name, *keys
  puts "Read rule with: #{name} #{keys.to_s}"
  @grammar.rules[name] = Rule.new keys
end

def codex *rulenames
  puts "Read codex with: #{rulenames.to_s}"
  @grammar.codex << (Codex.new rulenames)
end

load 'script.lero'
@grammar.generate