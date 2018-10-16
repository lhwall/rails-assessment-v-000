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
    @event = Event.new(event_params(:name, :location, :date, :time, :description))
    @event.user = current_user
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params(:name, :location, :date, :time, :description))
    redirect_to event_path(@event)
  end

private
def event_params(*args)
  params.require(:event).permit(*args)
end

end
