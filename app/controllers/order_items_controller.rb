class OrderItemsController < ApplicationController
  def show
    if @user
      order_id = Order.where(:user_id => session[:current_user_id])
      @order_items = OrderItem.where(:order_id => order_id.ids)
      render :myorders
    else
      redirect_to "/"
    end
  end

  def update
    if @owner
      id = params[:id]
      if id.present?
        order_item = OrderItem.find(id)
        order_item.delivered = true
        order_item.save
        flash[:notice] = "Order Item ID " + order_item.id.to_s + " changed to delivered."
        redirect_to "/owners/show_to_owner"
      else
        flash[:alert] = "Unable to find order!!"
        render :"owners/allorders"
      end
    else
      redirect_to "/"
    end
  end

  def create
    if @user
      @cart = Cart.where(:user_id => session[:current_user_id])
      @cart.each do |item|
        @order_items = OrderItem.create!(order_id: params[:order_id])
        @order_items.submenu_items_id = item.submenu_items_id
        @order_items.submenu_items_description = item.submenu_items_description
        @order_items.quantity = item.quantity
        @order_items.submenu_item_price = item.submenu_item_price
        @order_items.save
      end
      Cart.where(:user_id => session[:current_user_id]).destroy_all
      flash[:notice] = "Your order has been placed."
      show()
    else
      redirect_to submenu_items_path
    end
  end
end
