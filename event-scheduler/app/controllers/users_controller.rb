class UsersController < ApplicationController


    def index
      @users = User.all
    end

    def new
      @user = User.new
      render :layout => "loginsignup"
    end

    def create
      #byebug
      if params[:user][:username] == "" || params[:user][:password_digest] == ""
            flash[:message] = "Please enter a username and password"
            redirect_to new_user_path
          elsif !!User.find_by(username: params[:user][:username])
            flash[:message] = "That user name is taken"
            redirect_to new_user_path
          else
            @user = User.new(user_params)
            @user.save
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

def user_params
  params.require(:user).permit(:username, :password, :password_confirmation)
end

end
