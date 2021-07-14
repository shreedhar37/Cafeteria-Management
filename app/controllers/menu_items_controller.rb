class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
    render "index"
  end
end
