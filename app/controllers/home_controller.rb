class HomeController < ApplicationController
  def index
    if session[:current_user_id]
      @user = User.find_by(id: session[:current_user_id])
      @owner = Owner.find_by(id: session[:current_user_id])
    end
  end
end
