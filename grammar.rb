class Grammar

  attr_accessor :rules

  def initialize
    @rules = {}
  end

  def generate args
    text = ''
    args.each do |rulename, qty| 
      (1..qty).each { text << "#{@rules[rulename.to_s].to_s} " }
    end
    puts "Final result: \n========\n#{text}\n========"
  end

end