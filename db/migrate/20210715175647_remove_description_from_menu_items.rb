class RemoveDescriptionFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :description, :string
    remove_column :menu_items, :price, :float
  end
end
