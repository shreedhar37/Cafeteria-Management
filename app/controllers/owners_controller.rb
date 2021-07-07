class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def index
    if @owner
      render :index
    else
      redirect_to "/owners/sign_in"
    end
  end

  def delete_user
    if @owner
      render :delete
    else
      redirect_to "/"
    end
  end
end
