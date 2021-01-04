class Address < ActiveHash::Base

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_from

  validates :post, :city, :address, :phone, presence: true
  validates :shipping_from_id, numericality: { other_than: 1 }
  validates :post, format: {with: /\A\d{3}[-]\d{4}\z/, message: "-(ハイフン)を含めて入力してください"}
  validates :phone, format: {with: /\A\d{10,11}\z/, message: "-(ハイフン)を含まず10桁か11桁で入力してください"}
end
