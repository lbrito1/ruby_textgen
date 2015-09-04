require 'singleton'

class Dictionary
  include Singleton

  
  def add key, values
    @dicts ||= {}
    @dicts[key] = values
  end

  def fetch key
    puts "Fetching #{key} from dictionary"
    atom = @dicts[key]
    (atom.nil? || atom.empty?) ? key.to_s : atom[(rand*atom.size).to_i]
  end

end