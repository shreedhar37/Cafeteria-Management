class SessionsController < ApplicationController
  def new
  end

  def create
    role = request.path == users_sign_in_path ? User.find_by(email: params[:email]) : Owner.find_by(email: params[:email])
    if role.present? && role.authenticate(params[:password])
      session[:current_user_id] = role.id
      redirect_path = request.path == users_sign_in_path ? "/users/index" : "/owners"
      redirect_to redirect_path
    else
      flash[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to "/"
  end
end
