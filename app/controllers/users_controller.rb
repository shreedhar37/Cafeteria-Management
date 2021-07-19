class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    if @user
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
        render :"owners/delete_user"
      else
        flash[:error] = "Unable to delete the user. Please check the id."
        render :"owners/delete_user"
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

  def update
    if @owner
      id = params[:id]
      user = User.find_by(id: id)
      if user.present?
        user.first_name = params[:first_name].capitalize
        user.last_name = params[:last_name].capitalize
        user.email = params[:email]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
        if user.save
          flash[:notice] = "User updated successfully."
          render :"owners/update_user"
        else
          flash[:error] = "password confirmation doesn't match with password."
          render :"owners/update_user"
        end
      else
        flash[:error] = "Unable to find user. Please check the id."
        render :"owners/update_user"
      end
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome #{@user.first_name}"
      redirect_to submenu_items_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
