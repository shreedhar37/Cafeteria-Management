class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:current_user_id]
      Current.user = User.find_by(id: session[:current_user_id])
      Current.owner = Owner.find_by(id: session[:current_user_id])
    end
  end
end
