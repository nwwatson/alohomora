class Alohomora::Organization < ActiveRecord::Base
  attr_accessible :active, :creator_id, :name
end
