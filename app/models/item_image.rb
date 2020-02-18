class ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true

  validates :image, presence: true
  # mount_uploader :file_name, PictureUploader
end
