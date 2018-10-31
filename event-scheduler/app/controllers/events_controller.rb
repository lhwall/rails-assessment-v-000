require "rack-flash"

class EventsController < ApplicationController
use Rack::Flash

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.category = Category.find_or_create_by(name: "")
  end

  def create
  #  byebug
    @event = Event.new(event_params(:name, :location, :date, :time, :description))
    if @event.valid? #params[:event][:name] == "" || params[:event][:location] == "" || params[:event][:date] == ""|| params[:event][:time] == ""
      @event.category = Category.find_or_create_by(name: params[:event][:category])
      @event.user = current_user
      @event.save
      redirect_to event_path(@event)
  else
  @errors = @event.errors
    redirect_to new_event_path
  end
end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])

  end

  def chronological
    @events = Event.upcoming_events
  end

  def update
    @event = Event.find(params[:id])
    #byebug
    if current_user == @event.user
      if params[:event][:name] == "" || params[:event][:location] == "" || params[:event][:date] == ""|| params[:event][:time] == ""
        flash[:message] = "Please include a name, location, date, and time for your event"
        redirect_to edit_event_path(@event)
  else
    @event.update(event_params(:name, :location, :date, :time, :description))
    @event.category = Category.find_or_create_by(name: params[:event][:category])
      flash[:message] = "Your event has been updated"
    redirect_to event_path(@event)
    end
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
