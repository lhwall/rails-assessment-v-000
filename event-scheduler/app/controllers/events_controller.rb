class EventsController < ApplicationController

  def index
    @events = Event.all 
  end 

  def new
    @event = Event.new 
  end 

  def create 
  end

  def show 
    @event = Event.find(params[:id])
  end 

  def edit 
    @event = Event.find(params[:id])
  end

  def update 
  end 

end
