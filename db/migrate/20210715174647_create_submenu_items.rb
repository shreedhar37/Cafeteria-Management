class CreateSubmenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :submenu_items do |t|
      t.bigint :menu_items_id
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
