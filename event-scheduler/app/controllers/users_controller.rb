class UsersController < ApplicationController


    def index
      @users = User.all
    end

    def new
      @user = User.new
      render :layout => "loginsignup"
    end

    def create
      @user = User.new(user_params)
    if @user.valid?
      @user.save
     redirect_to user_path(@user)
    else
    @errors = @user.errors
      render :new
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
