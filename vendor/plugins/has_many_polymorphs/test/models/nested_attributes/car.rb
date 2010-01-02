require 'nested_attributes/possession'

class Car < Possession
  def modify
    self.description = "1977 3-door Volkswagon Beetle"
  end
end
