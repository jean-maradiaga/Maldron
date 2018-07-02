class Post < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, length: {maximum: 140}
  validates :content, :category_id, presence: true
  mount_uploader :image, ImageUploader
end
