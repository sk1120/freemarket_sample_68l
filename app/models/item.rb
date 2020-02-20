class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :brand
  belongs_to :category
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :postage
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_means

end