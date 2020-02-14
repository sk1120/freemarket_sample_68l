class DeliverAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip_code, :prefecture, :city, :address1, presence: true
end
