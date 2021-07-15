class MenuItem < ApplicationRecord
  belongs_to :menu_category
  has_many :submenu_items
end
