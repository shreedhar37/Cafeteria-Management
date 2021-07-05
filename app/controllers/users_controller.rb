class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    if Current.user
      render :"index"
    else
      redirect_to "/"
    end
  end

  def show
    if Current.owner
      @users = User.all
      render :"owners/show"
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to "/", notice: "Successfully created your account."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
