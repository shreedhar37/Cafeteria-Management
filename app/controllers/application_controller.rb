class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:current_user_id] || session[:current_owner_id]
      @user = User.find_by(id: session[:current_user_id])
      @owner = Owner.find_by(id: session[:current_owner_id])
    end
  end
end
