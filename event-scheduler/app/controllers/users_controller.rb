class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      if params[:username] == "" || params[:password] == ""
            flash[:message] = "Please enter a username and password"
            redirect to "/sign_up"
          elsif !!User.find_by(username: params[:username])
            flash[:message] = "That user name is taken"
            redirect to "/sign_up"
          else
            @user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)

        end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
    end


private

def user_params(*args)
  params.require(:user).permit(*args)
end

end
