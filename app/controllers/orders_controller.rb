class OrdersController < ApplicationController
  def destroy
    id = params[:id].to_i
    order = OrderItem.find(OrderItem.where("order_id = ?", id).pluck(:id))
    for i in order
      i.destroy
    end
    redirect_to orders_path
  end

  def update
    redirect_to menu_items_path
  end
end
