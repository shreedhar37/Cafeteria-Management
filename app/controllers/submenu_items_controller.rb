class SubmenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
    @menu_categories = MenuCategory.all
    @submenu_items = SubmenuItem.all
    render :"users/index"
  end
end
