class Rule

  attr_accessor :keys

  def initialize keys
    @keys = keys
  end

  def apply
    text = ''
    keys.each do |key|
      puts "Applying rule with key: #{key.to_s}"
      word = Dictionary.instance.fetch key
      text << ' ' << word
    end
    text
  end

end