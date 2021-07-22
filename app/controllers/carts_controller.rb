class CartsController < ApplicationController
  def addq
    if @user
      cart_item = Cart.find(params[:id])
      submenu_item = SubmenuItem.find(cart_item.submenu_items_id)
      if cart_item.present?
        cart_item.quantity += 1
        cart_item.submenu_item_price = submenu_item.price * cart_item.quantity
        cart_item.save
        redirect_to submenu_items_path
      else
        redirect_to submenu_items_path
      end
    else
      redirect_to "/"
    end
  end

  def removeq
    if @user
      cart_item = Cart.find(params[:id])
      if cart_item.present?
        submenu_item = SubmenuItem.find(cart_item.submenu_items_id)
        cart_item.quantity -= 1
        if cart_item.quantity > 0
          cart_item.submenu_item_price = submenu_item.price * cart_item.quantity
          cart_item.save
          redirect_to submenu_items_path
        end
      else
        redirect_to submenu_items_path
      end
    else
      redirect_to "/"
    end
  end

  def destroy
    if @user
      cart_item = Cart.find(params[:id])
      if cart_item.present?
        flash[:notice] = cart_item.submenu_items_description + " removed."
        cart_item.destroy
        redirect_to submenu_items_path
      else
        flash[:alert] = "Sorry, unable to find the your order."
        redirect_to submenu_items_path
      end
    else
      redirect_to "/"
    end
  end

  def update
    submenu_item = SubmenuItem.find(@cart.submenu_items_id)
    @cart.quantity += 1
    @cart.submenu_item_price = submenu_item.price * @cart.quantity
    if @cart.save
      flash[:notice] = params[:quantity].to_s + " " + params[:submenu_items_description] + " added to cart."
    end
  end

  def create
    if @user
      @cart = Cart.find_by(:submenu_items_id => params[:submenu_items_id])
      if @cart
        update()
        redirect_to submenu_items_path
      else
        parameters = cart_params()
        parameters[:submenu_item_price] = parameters[:submenu_item_price].to_f * parameters[:quantity].to_f
        @cart = Cart.new(parameters)
        if @cart.save
          flash[:notice] = params[:quantity].to_s + " " + params[:submenu_items_description] + " added to cart."
          redirect_to submenu_items_path
        else
          flash[:alert] = "We are sorry, something went wrong."
          redirect_to submenu_items_path
        end
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
