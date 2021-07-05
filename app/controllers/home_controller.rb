class HomeController < ApplicationController
  def index
    if Current.user || Current.owner
      path = Current.user.present? ? "users/index" : "owners/index"
      render path
    else
      render :index
    end
  end
end
