class ItemsController < ApplicationController
  def index
  end

  def new
    
    if user_signed_in?
      @item = Item.new
    else 
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
     params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_day_id, :shipping_from_id, :image).merge(user_id: current_user.id)
  end
end
