class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :shipping_from
  has_one_attached :image

  validates :name, :description,:image, presence: true
  with_options presence: true, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"} do
    validates :price
  end
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は、￥300~¥9,999,999の範囲内で設定してください" }
  validates :category_id, numericality: {other_than: 1}
  validates :condition_id, numericality: {other_than: 1}
  validates :shipping_charge_id, numericality: {other_than: 1}
  validates :shipping_day_id, numericality: {other_than: 1}
  validates :shipping_from_id, numericality: {other_than: 1}

end
