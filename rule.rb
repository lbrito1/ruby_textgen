class Rule

  attr_accessor :name, :options

  def initialize name
    @name = name
    @options = []
  end

  def to_s
    randkeys = options[(rand*options.size).to_i]
    puts "Applying rule with keys: #{randkeys.to_s}. \nAvailable options: #{options.to_s}"
    randkeys.map { |k| k.to_s }
    randkeys.join(" ")
  end

end