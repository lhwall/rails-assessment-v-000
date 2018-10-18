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
 if @user && @user.authenticate(params[:password])
   session[:user_id] = @user.id
 redirect_to user_path(@user)
 else
   flash[:message] = "That is not the correct password or that username does not exist"
   redirect_to login_path
end
end

def logout
  session[:user_id].clear
  redirect_to "/index"
end

end
