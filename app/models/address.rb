class Address < ActiveHash::Base

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_from
end
