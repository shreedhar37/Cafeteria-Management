class SubmenuItemsController < ApplicationController
  def index
    if @user
      @menu_items = MenuItem.all
      @menu_categories = MenuCategory.all
      @submenu_items = SubmenuItem.all
      render :"users/index"
    else
      redirect_to "/users/sign_in"
    end
  end
end
