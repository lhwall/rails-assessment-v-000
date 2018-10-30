require "rack-flash"

class EventsController < ApplicationController
use Rack::Flash

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
  #  byebug
    if params[:event][:name] == "" || params[:event][:location] == "" || params[:event][:date] == ""|| params[:event][:time] == ""
      flash[:message] = "Please include a name, location, date, and time for your event"
      redirect_to new_event_path

  else
    @event = Event.new(event_params(:name, :location, :date, :time, :description))
    @event.user = current_user
    @event.save
    redirect_to event_path(@event)
  end
end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])

  end

  def update
    @event = Event.find(params[:id])
    #byebug
    if current_user == @event.user
    @event.update(event_params(:name, :location, :date, :time, :description))
      flash[:message] = "Your event has been updated"
    redirect_to event_path(@event)
  else
    flash[:message] = "You do not have permission to edit this event"
    redirect_to event_path(@event)
  end
end

private
def event_params(*args)
  params.require(:event).permit(*args)
end

end
