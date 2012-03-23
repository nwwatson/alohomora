require 'factory_girl'

Factory.define :organization do |org|
  org.sequence(:name) { |n| "Organization#{n}" }
end

Factory.define :email do |email|
  email.sequence(:address) { |n| "user#{n}@entropisoftware.com" }
end

Factory.define :user do |user|
  user.sequence(:first_name) { |n| "FirstName#{n}" }
  user.sequence(:last_name) { |n| "LastName#{n}" }
  user.password "password"
  user.password_confirmation "password"
  user.emails {|emails| [emails.association(:email)]}
  
end
