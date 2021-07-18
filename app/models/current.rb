class Current < ActiveSupport::CurrentAttributes
  attribute :user, :owner, :menu_category,
            :menu_item, :submenu_item,
            :order, :order_item, :cart
end
