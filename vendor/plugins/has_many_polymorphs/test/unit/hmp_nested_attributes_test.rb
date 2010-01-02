require File.dirname(__FILE__) + '/../test_helper'

if Rails::VERSION::MAJOR >= 2 and Rails::VERSION::MINOR >= 3
  require 'nested_attributes/car'
  require 'nested_attributes/guitar'
  require 'nested_attributes/owners_possession'
  require 'nested_attributes/owner'

  class HMPNestedAttributesTest < ActiveSupport::TestCase
    fixtures :owners, :possessions

    def test_nested_attributes_works
      if Rails::VERSION::MAJOR < 2 or Rails::VERSION::MINOR < 3
        assert true, "Nested attributes not present in Rails before v2.3"
        return
      end

      owner = Owner.find(1)
      car = Car.find(1)
      guitar = Guitar.find(2)
      assert owner.possessions << car
      assert owner.possessions << guitar

      possessions_params = {}
      owner.possessions.each_with_index do |possession, index|
        possession.modify
        possessions_params[index] = possession.attributes
        possession.reload
      end

      owner_params = {
        "id" => 1, "name" => "James",
        "possessions_attributes" => possessions_params
      }

      # This call demonstrates that has_many_polymorphs doesn't quite work
      #  with accepts_nested_attributes_for, due to the :has_many_polymorphs
      #  reflection macro not being a part of a couple switches in ActiveRecord.
      # The relevant files in ActiveRecord are:
      #   .../active_record/autosave_association.rb
      #   .../active_record/nested_attributes.rb
      owner.update_attributes(owner_params)

      # This is really testing accepts_nested_attributes_for, I guess.
      car.reload
      guitar.reload
      assert_equal "1977 3-door Volkswagon Beetle", car.description
      assert_equal "1970 7-string Gibson SG Special", guitar.description
    end
  end
end
