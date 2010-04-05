When /^I fill in "([^\"]*)" for the (.+) of field group (.+)$/ do |text, attr, index_str|
  index = index_str.to_i
  fully_qualified_field = "survey_schema_field_groups_attributes_#{index}"
  fully_qualified_field += "_#{attr}"
  
  fill_in fully_qualified_field, :with => text
end

Then /the (.+) of field group (.+) should be "(.+)"/ do |attr, id, text|
  field = "survey_schema_field_groups_attributes_#{id}_#{attr}"
  value = selenium.field("id=#{field}")
  assert_match(/#{text}/, value)
end
