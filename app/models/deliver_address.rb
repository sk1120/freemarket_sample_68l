class DeliverAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name2, :first_name2, :family_name_kana2, :first_name_kana2, :zip_code, :prefecture, :city, :address1, presence: true
end
