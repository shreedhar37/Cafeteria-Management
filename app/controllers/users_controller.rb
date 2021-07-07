class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    if @owner
      render :index
    else
      redirect_to "/users/sign_in"
    end
  end

  def destroy
    if @owner
      id = params[:id]
      user = User.find_by(id: id)
      if user.present?
        user.destroy
        flash[:notice] = "User deleted Successfully"
        render :"owners/delete"
      else
        flash[:error] = "Unable to delete the user. Please check the id."
        render :"owners/delete"
      end
    else
      redirect_to "/"
    end
  end

  def show
    if @owner
      @users = User.all
      render :"owners/display_user"
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = "Successfully created new account."
      render :index
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
