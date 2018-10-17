class SessionsController < ApplicationController

def index
  @events = Event.all
end

def login
end

def logout
  session[:user_id].clear
end

end
