Given /^I am not logged in$/ do
  step %{I sign out}
end

Given /^no user exists with an email of "([^"]*)"$/ do |email|
  User.joins(:emails).where(:emails => {:address => email}).first.should be_nil
end

When /^I go to the sign in page$/ do
  visit '/signin'
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign In"}
end

Then /^I go to the home page$/ do
  visit '/'
end

Then /^I should be signed out$/ do
  step %{I should see "Sign In"}
  step %{I should not see "Log Out"}
end

Given /^I am a user with an email "([^"]*)" and password "([^"]*)"$/ do |address, password|
  user = Factory(:user, :password => password, :password_confirmation => password)
  email = Factory(:email, :address => address, :user => user)
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

When /^I return next time$/ do
  step %{I go to the home page}
end

Then /^I should be already signed in$/ do
  step %{I should see "Sign Out"}
end

Then /^I sign out$/ do
  visit '/signout'
end

Given /^I go to the sign up page$/ do
  visit '/signup'
end

Given /^there is a a user exists with an email of "([^"]*)"$/ do |email|
  #user = Factory(:user)
  #organization = Factory(:organization, :creator_id => user.id)
  email = Factory(:email_with_user, :address => email)
end