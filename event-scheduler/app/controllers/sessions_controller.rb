class SessionsController < ApplicationController

def index
  @events = Event.all
end

def login
  @user = User.new
  render layout: false
end

def login_user
  @user = User.find_by(:username => params[:username])
  #byebug
  if @user == nil
    flash[:message] = "That username does not exist"
    redirect_to login_path
 elsif @user.authenticate(params[:password])
   session[:user_id] = @user.id
 redirect_to user_path(@user)
 else
   flash[:message] = "That is not the correct password"
   redirect_to login_path
end
end

def logout
  session.delete(:user_id)
  redirect_to events_path
end

end
