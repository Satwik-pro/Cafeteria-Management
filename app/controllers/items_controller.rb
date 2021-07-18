class ItemsController < ApplicationController
  def index
    render "index"
  end

  def create
    items = MenuItem.all
    count = MenuItem.all.count
    maxCount = 0
    count = count - 1
    for i in 0..count
      if items.pluck(:menu_category_id)[i] > maxCount
        maxCount = items.pluck(:menu_category_id)[i]
      end
    end
    maxCount = maxCount + 1
    new_item = MenuItem.new(
      menu_category_id: maxCount,
      name: params[:name],
      description: params[:desc],
      price: params[:price].to_i,
    )

    if new_item.save
      redirect_to admins_path
    end
  end

  def destroy
    id = params[:id].to_i
    menu = MenuItem.find(MenuItem.where("menu_category_id = ?", id).pluck(:id)[0])
    menu.destroy
    redirect_to admins_path
  end

  def show
    render "edit"
  end
end
