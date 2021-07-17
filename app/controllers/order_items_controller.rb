class OrderItemsController < ApplicationController
  def create
    iid = params[:id].to_i
    uid = current_user.id
    name = MenuItem.find(iid).name
    desc = MenuItem.find(iid).description
    price = MenuItem.find(iid).price
    new_order = OrderItem.new(
      order_id: uid,
      menu_item_id: iid,
      menu_item_name: name,
      menu_item_price: price,
    )
    new_order.save
    redirect_to order_items_path
  end

  def destroy
    id = params[:id].to_i
    order = OrderItem.find(OrderItem.where("order_id = ? and menu_item_id = ?", current_user.id, id).pluck(:id)[0])
    order.destroy
    redirect_to order_items_path
  end
end
