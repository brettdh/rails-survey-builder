When /^I click the '(.+)' link$/ do |link_text|
  selenium.click "link=#{link_text}"
end

When /^I wait ([0-9]+) seconds/ do |seconds|
  sleep(seconds.to_i)
end

When /^I wait for "([^\"].+)" to appear/ do |text|
  selenium.wait_for :wait_for => :text, :text => /text/
end

Then /^I should see "([^\"]+)" inside "([^\"]+)"/ do |text, selector|
  assert selenium.element?("css=#{selector}")
  assert_match(/#{text}/, selenium.text(selector))
end
