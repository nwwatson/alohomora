Given /^I am not logged in$/ do
  step %{I sign out}
end

Given /^no user exists with an email of "([^"]*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

When /^I go to the sign in page$/ do
  visit '/signin'
end

When /^I sign in as "(.*)\/(.*)"$/ do |username, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Username" with "#{username}"}
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

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  Factory(:user, :username => name, :email => email, :password => password, :password_confirmation => password)
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
  user = Factory(:user)
  organization = Factory(:organization, :creator_id => user.id)
  #email = Factory(:email, :address => email, :user => user)
end