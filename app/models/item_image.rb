class ItemImage < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :item

  # validates :image, presence: true
  mount_uploader :image_url, PictureUploader
end
