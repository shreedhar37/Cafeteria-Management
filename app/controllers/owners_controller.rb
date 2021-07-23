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
      render :delete_user
    else
      redirect_to "/"
    end
  end

  def update_user
    if @owner
      render :update_user
    else
      redirect_to "/"
    end
  end

  def show_to_owner
    if @owner
      @orders = OrderItem.all
      render :"owners/allorders"
    end
  end

  def show_menu
    if @owner
      @menu_categories = MenuCategory.all
      render :showmenu
    else
      redirect_to "/"
    end
  end

  def addmenu
    if @owner
      render :addmenu
    else
      redirect_to "/"
    end
  end
end
