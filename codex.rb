class Codex

  attr_accessor :rule_names

  def initialize rule_names
    @rule_names = rule_names
  end

  def run rules
    text = ''
    @rule_names.each do |rule_name| 
      puts "Codex is applying #{rule_name}"
      text << rules[rule_name].to_s
    end
    text
  end

end