require "rack-flash"

class EventsController < ApplicationController
use Rack::Flash

  def index
    if params[:user_id]
      #byebug
      @events = User.find(params[:user_id]).events
    else
    @events = Event.all
  end
  end

  def new
    @event = Event.new(category_id: params[:category_id])
  end

  def create
  #  byebug
    @event = Event.new(event_params(:name, :location, :date, :time, :description))
    @event.category = Category.find_or_create_by(name: params[:event][:category])

    if @event.valid?
      @event.user = current_user
      @event.save
      redirect_to event_path(@event)
  else
  @errors = @event.errors
    render :new
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
    if current_user == @event.user
    @event.update(event_params(:name, :location, :date, :time, :description))
    @event.category = Category.find_or_create_by(name: params[:event][:category])
      if @event.valid?
        @event.save
      redirect_to event_path(@event)
  else
    @errors = @event.errors
    render :edit
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
