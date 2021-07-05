class ManageController < ApplicationController
  before_action :set_current_user

  def index
    if Current.owner
      render :index
    else
      redirect_to "/"
    end
  end

  def show
    if Current.owner
      @users = User.all
      render :show
    else
      redirect_to "/"
    end
  end
end
