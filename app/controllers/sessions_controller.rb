class SessionsController < ApplicationController
  def new
  end

  def create
    user = request.path == "/users/sign_in" ? User.find_by(email: params[:email]) : Owner.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_path = request.path == "/users/sign_in" ? "/" : "/manage"
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
