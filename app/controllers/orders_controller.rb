require "date"

class OrdersController < ApplicationController
  def destroy
    id = params[:id].to_i

    do_order = Order.new(
      date: Date.today,
      user_id: id,
      delivered: false,
    )

    do_order.save

    order = OrderItem.find(OrderItem.where("order_id = ?", id).pluck(:id))
    for i in order
      i.destroy
    end
    redirect_to orders_path
  end

  def show
    id = params[:id].to_i
    orders = Order.where("user_id = ?", id)
    orders[0].delivered = true
    orders[0].save!
    redirect_to admins_path
  end

  def update
    redirect_to menu_items_path
  end
end
