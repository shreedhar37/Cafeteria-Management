class ChangeMenuitemsidToMenuitemid < ActiveRecord::Migration[6.1]
  def change
    rename_column :submenu_items, :menu_items_id, :menu_item_id
  end
end
