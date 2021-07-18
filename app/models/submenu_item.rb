class SubmenuItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :cart
end
