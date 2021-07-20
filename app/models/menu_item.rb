class MenuItem < ApplicationRecord
  has_many :submenu_items
  belongs_to :menu_category
end
