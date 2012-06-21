class Alohomora::Organization < AlohomoraModel
  attr_accessible :active, :creator_id, :name
  
  has_and_belongs_to_many :users
end
