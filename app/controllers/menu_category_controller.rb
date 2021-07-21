class MenuCategoryController < ApplicationController
  def create
    if @owner
      name = menu_category_params()
      menu_name = menu_item_params()
      submenu_description = submenu_item_params()

      @menu_categories = MenuCategory.select(:id).find_by("name=?", name[:name])
      @menu_items = MenuItem.select(:id).find_by("menu_item_name=?", menu_name[:menu_item_name])
      @submenu_items = SubmenuItem.find_by("description=?", submenu_description[:description])

      if !@menu_categories.present?
        @menu_categories = MenuCategory.new(menu_category_params)
        @menu_categories.save!
      end

      if !@menu_items.present?
        @menu_items = MenuItem.new(menu_item_params)
        @menu_items.menu_category_id = @menu_categories.id
        @menu_items.save!
      end

      if !@submenu_items.present?
        @submenu_items = SubmenuItem.new(submenu_item_params)
        @submenu_items.menu_item_id = @menu_items.id
        @submenu_items.save! ? flash[:notice] = "New Menu Addedd Successfully." : flash[:alert] = "Something went wrong!!"
      else
        flash[:error] = "This menu item is already present!!"
      end

      render :"owners/addmenu"
    else
      redirect_to "/"
    end
  end

  private

  def menu_category_params
    params.permit(:name)
  end

  def menu_item_params
    params.permit(:menu_item_name)
  end

  def submenu_item_params
    params.permit(:description, :price)
  end
end
