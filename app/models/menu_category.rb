class MenuCategory < ApplicationRecord
  has_many :menu_items

  def find_menuitem(menu_id)
    MenuItem.find_by(menu_category_id: menu_id)
  end
end
