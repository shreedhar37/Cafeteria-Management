class HomeController < ApplicationController
  def index
    if @user || @owner
      path = @user.present? ? "/submenu_items" : "/owners"
      redirect_to path
    else
      render :index
    end
  end
end
