class Rule

  attr_accessor :name, :options

  def initialize name
    @name = name
    @options = []
  end

  def to_s
    randkeys = options.sample
    randkeys.map! { |k| k.to_s }
    verbose "Applying rule #{@name} with keys: #{randkeys}."
    randkeys.join(" ")
  end

end