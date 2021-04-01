class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { in: 1..1000 }
  validates :image, presence: true
  validates :user_id, presence: true
end
