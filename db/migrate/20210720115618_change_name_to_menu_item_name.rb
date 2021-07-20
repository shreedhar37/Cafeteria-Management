class ChangeNameToMenuItemName < ActiveRecord::Migration[6.1]
  def change
    rename_column :menu_items, :name, :menu_item_name
  end
end
