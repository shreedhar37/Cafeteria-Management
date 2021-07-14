class MenuCategory < ActiveRecord::Base
  def index
    @menu_category = MenuCategory.all
end
