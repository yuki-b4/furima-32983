class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post, :shipping_from_id, :city, :address, :building, :phone, :purchase_id, :user_id, :item_id   #, :number, :exp_month, :exp_year, :cvc, 

  with_options presence: true do
    validates :post, format: {with: /\A\d{3}[-]\d{4}\z/, message: "-(ハイフン)を含めて入力してください"}
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "-(ハイフン)を含まず10桁か11桁で入力してください"}
  end
  validates :city, :address, presence: true
  validates :shipping_from_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    binding.pry
    Address.create(post: post, shipping_from_id: shipping_from_id, city: city, address: address, building: building, phone: phone, purchase_id: purchase.id)
  end
end
