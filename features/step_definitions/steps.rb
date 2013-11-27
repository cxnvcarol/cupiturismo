#Given(/^I am on the home page$/) do
 # pending # express the regexp above with the code you wish you had
#end
#Then(/^I should see "(.*?)"$/) do |arg1|
 # pending # express the regexp above with the code you wish you had
#end

When /^I am on the home page$/ do
  visit 'http://localhost:3000'

end
Then /^I should see "CupiTurismo"$/ do |text|
  page.should have_content(text)
end

When /^I fill register form$/ do
  visit 'http://localhost:3000/users/sign_in'
  fill_in('user_name', :with => "Diomedes")
  fill_in('user_email', :with => "Diomedes@Diaz.com")
  fill_in('user_password', :with => "qwerty123")
  fill_in('user_password_confirmation', :with => "qwerty123")
  click_button("commit")
end
Then /^I should see "Bienvenid@ Diomedes"$/ do |text|
  page.should have_content(text)
end

When /^I sign in as Diomedes$/ do
  visit 'http://localhost:3000/users/sign_in'
  fill_in('user_email', :with => "Diomedes@Diaz.com")
  fill_in('user_password', :with => "qwerty123")
  click_button("commit")
end

When /^I click on + link$/ do
  visit 'http://localhost:3000/trips'
  click_link("+")

end

Then /^I should see "trip1"$/ do |text|
  page.should have_content(text)
end

When /^I click on delete link$/ do
  visit 'http://localhost:3000/trips'
  click_link("Eliminar")
end

Then /^I should not see "Bienvenid@ Diomedes"$/ do |text|
  page.should_not have_content(text)
end