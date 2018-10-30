class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  def self.upcoming_events
    #shows user all events that have not yet occured in chronological order
    upcoming_events = []
    Events.all do |event|
      if Time.now < event.time
        upcoming_events << event
      end
    end
    upcoming_events.sort_by! {|a,b| a.date <=> b.date}
    upcoming_events
  end


end
