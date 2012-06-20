# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alohomora_organization, :class => 'Alohomora::Organization' do
    name "MyString"
    creator_id 1
    active false
  end
end
