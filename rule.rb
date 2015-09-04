class Rule

  attr_accessor :keys

  def initialize keys
    @keys = keys
  end

  def apply
    puts "Applying rule with keys: #{keys.to_s}"
    keys.join(" ")
  end

end