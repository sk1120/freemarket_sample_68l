class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        VALID_family_name_REGEX = /\A[一-龥ぁ-ん]/
        VALID_family_name_kana_REGEX = /\A[ぁ-んー－]+\z/
        validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
        validates :family_name, presence: true, format: { with: VALID_family_name_REGEX}
        validates :first_name, presence: true, format: { with: VALID_family_name_REGEX}
        validates :family_name_kana, presence: true, format: { with: VALID_family_name_kana_REGEX}
        validates :first_name_kana, presence: true, format: { with: VALID_family_name_kana_REGEX}
        validates :password,    length: { minimum: 7 }

        has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
        has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
        has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
        has_many :items
        has_many :deliver_addresses, dependent: :destroy
end
