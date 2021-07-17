class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show edit update destroy ]

  def index
    render "index"
  end
end
