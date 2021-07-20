class MenuCategoryController < ApplicationController
  def create
    if @owner
      @menu_categories = MenuCategory.new(menu_category_params)

      if @menu_categories.save!
        @menu_items = MenuItem.new(menu_item_params)
        @menu_items.menu_category_id = @menu_categories.id

        if @menu_items.save!
          @submenu_items = SubmenuItem.new(submenu_item_params)
          @submenu_items.menu_item_id = @menu_items.id

          if @submenu_items.save!
            flash[:notice] = "New Menu Added Successfully."
            render :"owners/addmenu"
          end
        end
      end
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
