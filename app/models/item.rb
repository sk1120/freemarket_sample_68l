class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :category
  has_many :item_images , dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  enum condition: {
    '新品、未使用': "1",
    '未使用に近い': "2",
    '目立った傷や汚れなし': "3",
    'やや傷や汚れあり': "4",
    '傷や汚れあり': "5",
    '全体的に状態が悪い': "6"
  }

  enum shipping_date: {
    '1~2日で発送': "1",
    '2~3日で発送': "2",
    '4~7日で発送': "3"
  }

  enum postage: {
    '送料込み(出品者負担)': "1",
    '着払い(購入者負担)': "2"
  }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_means

end