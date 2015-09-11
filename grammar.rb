class Grammar

  attr_accessor :rules, :words

  def initialize
    @rules = {}
    @words = {}
    Struct.new 'Word', :key, :values do
      def to_s
        values.sample
      end
    end
  end

  def add_words key, values
    @words[key.to_s] = Struct::Word.new(key, values)
  end

  def generate args
    text = ''
    args.each do |rulename, qty| 
      (1..qty).each { text << @rules[rulename.to_s].to_s }
    end
    text.gsub!(/ \./, '.')
    text.gsub!(/\. [a-z]/) { |match| match[0..1] + match[-1].upcase }
    puts "Final result: \n========\n#{text}\n========"
  end

end