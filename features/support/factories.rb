require 'factory_girl'

Factory.define :organization do |org|
  org.sequence(:name) { |n| "Organization#{n}" }
end

Factory.define :email do |email|
  email.sequence(:address) { |n| "user#{n}@entropisoftware.com" }
  
  factory :with_user do
    user
  end  
end

Factory.define :user do |user|
  user.sequence(:first_name) { |n| "FirstName#{n}" }
  user.sequence(:last_name) { |n| "LastName#{n}" }
  user.password "password"
  user.password_confirmation "password"
  
  factory :with_email
    user.after_create {|a| [ Factory(:email, :user => a)] }
  end
  
end
