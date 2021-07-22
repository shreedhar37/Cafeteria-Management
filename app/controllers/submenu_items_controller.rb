class SubmenuItemsController < ApplicationController
  def index
    if @user
      @menu_items = MenuItem.all
      @menu_categories = MenuCategory.all
      @submenu_items = SubmenuItem.all
      @cart = Cart.where("user_id =?", session[:current_user_id])
      @cart_sum = Cart.where("user_id=?", session[:current_user_id]).sum(:submenu_item_price)
      render :"users/index"
    else
      redirect_to "/users/sign_in"
    end
  end
end
