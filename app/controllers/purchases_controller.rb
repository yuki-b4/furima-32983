class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index

  def index
    @item = Item.find(params[:item_id])
    # item_id = @item.id
    # puchases = Purchase.all
    if Purchase.exists?(item_id: @item.id)  #@itemに含まれるitem_id == purchasesテーブルに保存されている購入情報レコードのitem_id
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
    end

  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post, :city, :address, :phone, :shipping_from_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) #:email, :encrypted_password, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id 
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: "jpy",
      )
  end

end
