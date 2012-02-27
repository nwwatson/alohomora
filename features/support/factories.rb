require 'factory_girl'

=begin
Factory.define :photo do |asset|
  
end

Factory.define :profile do |profile|
  profile.first_name "First Name"
  profile.last_name "Last Name"
  profile.birth_date Time.now - 25.years
  profile.biography "This is my Biography. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vel nulla mi, nec pharetra magna. Cras aliquet pharetra purus nec rhoncus. Suspendisse potenti. In ornare lacus eu massa facilisis sed facilisis lorem euismod. Aliquam varius dui in risus auctor cursus. Ut quis leo magna, interdum elementum magna. Phasellus molestie est vitae orci cursus facilisis ut ut enim."
  profile.feedback_score 100
  profile.describe_score 100
  profile.communication_score 100
  profile.shipping_score 100
  profile.quality_score 100
  profile.photo Factory(:photo)
end



Factory.define :user do |user|
  user.sequence(:username) { |n| "username#{n}" }
  user.sequence(:email) { |n| "user#{n}@timeline.com" }
  user.profile Factory(:profile)
  user.password "password"
  user.password_confirmation "password"
end
=end