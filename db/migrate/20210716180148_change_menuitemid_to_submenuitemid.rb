class ChangeMenuitemidToSubmenuitemid < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_items, :menu_item_id, :submenu_items_id
  end
end
