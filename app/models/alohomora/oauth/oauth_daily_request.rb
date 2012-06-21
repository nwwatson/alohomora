class Alohomora::OauthDailyRequest < AlohomoraModel
  attr_accessible :created_at, :day, :month, :time_id, :times, :year
  
  # resource owner's client access
  belongs_to :oauth_access

  after_create :init_times

  # Increment the times counter that track the number of
  # requests a client have made in behalf of a resource
  # owner in a specific day
  def increment!
    self.times += 1
    self.save
  end

  class << self

    # Find a daily requests record
    def find_day(time)
      time_id = time_id(time)
      where(time_id: time_id)
    end

    # Define an identifier for a specific day
    def time_id(time)
      time.strftime("%Y%m%d")
    end
  end

  private

    # Add statistical informations
    def init_times
      self.day     = self.created_at.strftime("%d")
      self.month   = self.created_at.strftime("%m")
      self.year    = self.created_at.strftime("%Y")
      self.time_id = self.class.time_id(created_at)
      self.save
    end
end
