require 'singleton'

class Dictionary
  include Singleton

  
  def add key, values
    @dicts ||= {}
    @dicts[key] = values
  end

  def fetch key
    puts "Fetching #{key} from dictionary"
    @dicts[key][0] # should be random
  end

end