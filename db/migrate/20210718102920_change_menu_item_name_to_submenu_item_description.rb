class ChangeMenuItemNameToSubmenuItemDescription < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_items, :menu_item_name, :submenu_items_description
  end
end
