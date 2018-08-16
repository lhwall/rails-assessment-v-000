class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  def self.upcoming_events
    #shows user all events that have not yet occured in chronological order
  end

end