class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :brand
  belongs_to :category
  has_many :item_images


# extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to_active_hash :result_order
#   belongs_to_active_hash :size
#   belongs_to_active_hash :price_search
#   belongs_to_active_hash :item_status
#   belongs_to_active_hash :business_status
#   belongs_to_active_hash :shipping_method

  has_many :item_images,dependent: :delete_all
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # has_many :likes, dependent: :destroy
  # has_many :comments,dependent: :delete_all
  # has_many :messages,dependent: :delete_all
  belongs_to :user
  belongs_to :category
  belongs_to :brand,optional: true

  # with_options presence: true do
  #   validates :name, presence: true, ength: { maximum: 40 }
  #   validates :text, presence: true, length: { maximum: 1000 }
  #   validates :condition, presence: true
  #   validates :shipping_date, presence: true
  #   validates :postage, presence: true
  #   validates :shipping_means, presence: true
  #   validates :region, presence: true
  #   validates :shipping_date, presence: true
  #   validates :category_id, presence: true
  #   validates :child_category_id, presence: true
  #   validates :price, presence: true , numericality: { only_integr: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  # end

  # def like_user(user_id)
  #  likes.find_by(user_id: user_id)
  # end

  # ransacker :created_at do
  #   Arel::Nodes::SqlLiteral.new "date(items.created_at)"
  # end

  enum condition: {
    '新品、未使用': 1,
    '未使用に近い': 2,
    '目立った傷や汚れなし': 3,
    'やや傷や汚れあり': 4,
    '傷や汚れあり': 5,
    '全体的に状態が悪い': 6
  }

  enum shipping_date: {
    "1~2日で発送": 1,
    "2~3日で発送": 2,
    "4~7日で発送": 3
  }

  enum postage: {
    "送料込み(出品者負担)": 1,
    "着払い(購入者負担)": 2
  }

  enum shipping_means: {
    "未定": 1,
    "クロネコヤマト": 2,
    "ゆうパック": 3,
    "ゆうメール": 4
  }
end