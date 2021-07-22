class AllOrdersController < ApplicationController
  def index
    render "index"
  end

  def update
    id = params[:id].to_i
    orders = Order.where("user_id = ?", id)
    for i in orders
      if i.delivered == false
        i.delivered = true
        i.save!
        break
      end
    end
    redirect_to admins_path
  end
end
