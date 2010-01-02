class Owner < ActiveRecord::Base
  has_many_polymorphs :possessions, :from => [ :cars, :guitars ]
  accepts_nested_attributes_for :possessions
end
