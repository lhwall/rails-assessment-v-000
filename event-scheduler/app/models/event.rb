class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
  validates_associated :category


  def self.upcoming_events
    #shows user all events that have not yet occured in chronological order
    #byebug
  Event.order(:date).where("date >= ?", Date.today)
  end


end
