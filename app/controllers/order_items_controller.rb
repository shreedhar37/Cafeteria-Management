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

  def show_to_owner
    if @owner
      @order_items = OrderItem.all
      render :"owners/allorders"
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
