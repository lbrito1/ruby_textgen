class Grammar

  attr_accessor :rules, :codex

  def initialize
    @rules = {}
    @codex = []
  end

  def generate qty = 1
    text = ''
    (1..qty).each do |i|
      @codex.each { |codex| text << "\n#{i}\t#{(codex.run @rules)}" }
    end
    puts "Final result: \n========\n#{text}\n========"
  end

end