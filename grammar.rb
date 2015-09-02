class Grammar

  attr_accessor :rules, :codex

  def initialize
    @rules ||= {}
    @codex = []
    @dict = Dictionary.instance
  end

  def generate
    text = ''
    @codex.each { |codex| text << (codex.run @rules) }
    puts "Final result: \n========\n#{text}\n======="
  end

end