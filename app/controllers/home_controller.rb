class HomeController < ApplicationController
  def index
    if @user || @owner
      path = @user.present? ? "users/index" : "owners/index"
      render path
    else
      render :index
    end
  end
end
