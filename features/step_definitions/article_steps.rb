Given /^there is an article created with a title of "([^"]*)" and a body of "([^"]*)"$/ do |title, body|
  Factory(:article, title: title, body: body)
end