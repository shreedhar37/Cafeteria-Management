class CreateCart < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.bigint :submenu_items_id
      t.string :submenu_items_description
      t.bigint :quantity
      t.float :submenu_item_price

      t.timestamps
    end
  end
end
