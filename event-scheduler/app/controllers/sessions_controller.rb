class SessionsController < ApplicationController

def index
  @events = Event.all
end

def login
  @user = User.new
end

def login_user
end

def logout
  session[:user_id].clear
  redirect_to "/index"
end

end
