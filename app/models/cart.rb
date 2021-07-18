class Cart < ApplicationRecord
  has_many :submenu_items
  belongs_to :user
end
