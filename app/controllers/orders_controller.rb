class OrdersController < ApplicationController
  def create
    if @user
      @order = Order.create!(date: Date.today, user_id: session[:current_user_id])
      redirect_post("order_items/create",
                    params: { order_id: @order.id },
                    options: { authenticity_token: :auto })
    end
  end
end
