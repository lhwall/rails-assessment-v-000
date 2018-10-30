class SessionsController < ApplicationController

def index
  @events = Event.all
end

def login
  @user = User.new
  render layout: false
end

def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:user_id] = @user.id
  redirect_to user_path(@user)
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
  private

  def auth
    request.env['omniauth.auth']
  end


end
