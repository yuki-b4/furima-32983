class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post, :city, :address, :phone, :shipping_from_id).merge(user_id: current_user.id, item_id: params[:item_id]) #:email, :encrypted_password, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id 
      redirect_to root_path
    end
  end

end
