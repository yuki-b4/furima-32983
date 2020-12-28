class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :shipping_from
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  
  validates :category_id, numericality: {other_than: 1}
  validates :condition_id, numericality: {other_than: 1}
  validates :shipping_charge_id, numericality: {other_than: 1}
  validates :shipping_day_id, numericality: {other_than: 1}
  validates :shipping_from_id, numericality: {other_than: 1}

end
