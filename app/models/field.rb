class Field < ActiveRecord::Base
  FIELD_TYPES = {
    :short_answer => 1, 

    # text fields; single or multi-line
    # list-based response, corresponding to HTML elements
    :textarea => 2, 

    :check_container => 3, :radio_container=> 4, :combo_container => 5,

    # one text entry in a list-based response
    :option => 6
  }

  belongs_to :survey_schema
  belongs_to :field_group
  belongs_to :superfield, :through => :fields # may be nil
  has_many :subfields, :through => :fields # may be nil
end
