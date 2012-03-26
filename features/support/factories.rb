require 'factory_girl'


FactoryGirl.define do
  
  factory :organization do |org|
    org.sequence(:name) { |n| "Organization#{n}" }
  end
  
  factory :email do |email|
    email.sequence(:address) { |n| "user#{n}@entropisoftware.com" }

    factory :email_with_user do
      email.user {|email| email.association(:user) }
    end
  end
  
  factory :user do |user|
    user.sequence(:first_name) { |n| "FirstName#{n}" }
    user.sequence(:last_name) { |n| "LastName#{n}" }
    user.password "password"
    user.password_confirmation "password"

    #factory :with_email do
    #  FactoryGirl.create_list(:email, 1, :user => user)
    #end

  end
  
end











