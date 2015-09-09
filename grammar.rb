class Grammar

  attr_accessor :rules, :words

  def initialize
    @rules = {}
    @words = {}
    Struct.new 'Word', :key, :values do
      def to_s
        values[(rand*values.size).to_i]
      end
    end
  end

  def add_words key, values
    @words[key.to_s] = Struct::Word.new(key, values)
  end

  def generate args
    text = ''
    args.each do |rulename, qty| 
      (1..qty).each { text << "#{@rules[rulename.to_s].to_s} " }
    end
    puts "Final result: \n========\n#{text}\n========"
  end

end