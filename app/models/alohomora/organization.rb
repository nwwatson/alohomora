class Alohomora::Organization < AlohomoraModel
  attr_accessible :active, :creator_id, :name
  
  has_and_belongs_to_many :users, join_table: "alohomora_organizations_users"
  
  
  class << self
    
    # Requests a specific organization where the user has access to the information
    def get_user_organziation(org_id, user)
      self.joins(:users).where(id: org_id, users: {id: user.id}).first
    end
    
    
  end
  
end
