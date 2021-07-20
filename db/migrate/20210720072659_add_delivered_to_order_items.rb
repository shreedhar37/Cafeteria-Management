class AddDeliveredToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :delivered, :boolean
  end
end
