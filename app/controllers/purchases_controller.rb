class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index


  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new 
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id 
      redirect_to root_path
    end
  end

end
