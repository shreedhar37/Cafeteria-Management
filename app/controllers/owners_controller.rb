class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def index
    if Current.owner
      render :index
    else
      redirect_to "/owners/sign_in"
    end
  end
end
