class ChangeDeliveredToDelivered < ActiveRecord::Migration[6.1]
  def change
    change_column :order_items, :delivered, :boolean, default: false
  end
end
