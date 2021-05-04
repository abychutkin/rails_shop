class ItemsController < ApplicationController

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
    @item = find_item(params[:id])
  end
end