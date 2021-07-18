class OrderItemsController < ApplicationController
  def show
    a = User.select(:id).where(id: params[:id])
    b = Order.select(:id, :date, :updated_at).where(user_id: a.ids)
    c = OrderItem.select(:menu_item_name, :submenu_item_price).where(id: b.ids)

    b.map { |x| render plain: x.id.to_s + " " + x.updated_at.to_s(:long_ordinal) }
  end
end
