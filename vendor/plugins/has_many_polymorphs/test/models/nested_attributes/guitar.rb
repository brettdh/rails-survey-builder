require 'nested_attributes/possession'

class Guitar < Possession
  def modify
    self.description = "1970 7-string Gibson SG Special"
  end
end