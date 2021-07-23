class MenuItem < ApplicationRecord
  has_many :submenu_items
  belongs_to :menu_category

  def find_submenu_item(menu_item_id)
    SubmenuItem.select(:description, :price).find_by(menu_item_id: menu_item_id)
  end
end
