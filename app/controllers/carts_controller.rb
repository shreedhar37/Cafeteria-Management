class CartsController < ApplicationController
  def show
  end

  def create
    if @user
      parameters = cart_params()
      parameters[:submenu_item_price] = parameters[:submenu_item_price].to_f * parameters[:quantity].to_f
      @cart = Cart.new(parameters)
      if @cart.save
        flash[:notice] = params[:submenu_items_description] + " successfully added to cart."
        redirect_to submenu_items_path
      else
        flash[:alert] = "We are sorry, something went wrong."
        redirect_to submenu_items_path
      end
    else
      render :"sessions/new"
    end
  end

  private

  def cart_params
    params.permit(:authetication_token, :user_id, :submenu_items_id, :submenu_items_description, :quantity, :submenu_item_price)
  end
end
