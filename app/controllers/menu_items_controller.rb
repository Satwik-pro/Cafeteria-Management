class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show edit update destroy ]

  def index
    render "index"
  end

  def show
    id = params[:id]
    menu_item = current_user.menu_item.find(id)
    render plain: menu_item.to_displayable_string
  end

  def create
    new_order = Order_item.new(
      order_id: order_id,
      menu_item_id: menu_item_id,
      menu_item_name: menu_item_name,
      menu_item_price: menu_item_price,
      user_id: current_user.id,
    )
    if new_order.save
      redirect_to order_items_path
    end
  end
end
