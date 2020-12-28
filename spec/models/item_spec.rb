require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品情報の保存' do
      context '出品情報が保存できる場合' do
        it 'name, description, category_id, condition_id, shipping_charge_id, shipping_from_id, shipping_day_id, price, imageが入力されていれば保存できる' do
          expect(@item).to be_valid
        end
      end

      context '出品情報が保存できない場合' do
        it 'nameが入力されていない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'descriptionが入力されていない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'priceが入力されていない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'category_idが入力されていない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Category is not a number')
        end

        it 'condition_idが入力されていない' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition is not a number')
        end

        it 'shipping_charge_idが入力されていない' do
          @item.shipping_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge is not a number')
        end

        it 'shipping_from_idが入力されていない' do
          @item.shipping_from_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping from is not a number')
        end

        it 'shipping_day_idが入力されていない' do
          @item.shipping_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping day is not a number')
        end

        it 'imageが入力されていない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'priceが半角数字でないと保存できない' do
          @item.price = '３３３'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は、￥300~¥9,999,999の範囲内で設定してください')
        end

        it 'priceが300~9,999,999の間の値ではない' do
          @item.price = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は、￥300~¥9,999,999の範囲内で設定してください')
        end
      end
    end
  end
end
