require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "購入情報の保存" do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it "配送先情報とクレジットカード情報が正しく入力されていれば、登録できる" do
      expect(@purchase_address).to be_valid
    end

    it "郵便番号が空だと購入できない" do
      @purchase_address.post = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post can't be blank")
    end

    it "郵便番号にハイフンがないと購入できない" do
      @purchase_address.post = "8882222"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post -(ハイフン)を含めて入力してください")
    end

    it "phoneが空だと購入できない" do
      @purchase_address.phone = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
    end

    it "phoneにハイフンが含まれていると購入できない" do
      @purchase_address.phone = "090-1111-1111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone -(ハイフン)を含まず10桁か11桁で入力してください")
    end

    it "cityが空だと購入できない" do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空だと購入できない" do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end 

    it "shipping_from_idが空だと購入できない" do
      @purchase_address.shipping_from_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Shipping from を選択してください")
    end

    it "tokenが空だと登録できない" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end




