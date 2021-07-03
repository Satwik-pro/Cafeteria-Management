class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show edit update destroy ]

  def index
    # @todos = current_user.todos
    # @menu_items = current_user.menu_items
    render "index"
  end

  def show
    id = params[:id]
    menu_item = current_user.menu_item.find(id)
    render plain: menu_item.to_displayable_string
  end

  def create
    # todo_text = params[:todo_text]
    # due_date = params[:due_date]
    new_order = Order_item.new(
      order_id: order_id,
      menu_item_id: menu_item_id,
      menu_item_name: menu_item_name,
      menu_item_price: menu_item_price,
      # todo_text: todo_text,
      # due_date: due_date,
      # completed: false,
      user_id: current_user.id,
    )
    if new_order.save
      redirect_to order_items_path
      # else
      #   flash[:error] = new_order.errors.full_messages.join(", ")
      #   redirect_to menu_items_path
    end
  end

  # def update
  #   id = params[:id]
  #   completed = params[:completed]
  #   todo = current_user.todos.find(id)
  #   todo.completed = completed
  #   todo.save!
  #   redirect_to todos_path
  # end

  # def destroy
  #   id = params[:id]
  #   todo = current_user.todos.find(id)
  #   todo.destroy
  #   redirect_to todos_path
  # end

  # # GET /menu_items or /menu_items.json
  # def index
  #   render :index
  # end

  # # GET /menu_items/1 or /menu_items/1.json
  # def show
  # end

  # # GET /menu_items/new
  # def new
  #   @menu_item = MenuItem.new
  # end

  # # GET /menu_items/1/edit
  # def edit
  # end

  # # POST /menu_items or /menu_items.json
  # def create
  #   @menu_item = MenuItem.new(menu_item_params)

  #   respond_to do |format|
  #     if @menu_item.save
  #       format.html { redirect_to @menu_item, notice: "Menu item was successfully created." }
  #       format.json { render :show, status: :created, location: @menu_item }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @menu_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /menu_items/1 or /menu_items/1.json
  # def update
  #   respond_to do |format|
  #     if @menu_item.update(menu_item_params)
  #       format.html { redirect_to @menu_item, notice: "Menu item was successfully updated." }
  #       format.json { render :show, status: :ok, location: @menu_item }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @menu_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /menu_items/1 or /menu_items/1.json
  # def destroy
  #   @menu_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to menu_items_url, notice: "Menu item was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_menu_item
  #   @menu_item = MenuItem.find(params[:id])
  # end

  # # Only allow a list of trusted parameters through.
  # def menu_item_params
  #   params.require(:menu_item).permit(:menu_category_id, :name, :description, :price)
  # end
end
