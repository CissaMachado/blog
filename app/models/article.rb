class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  mount_uploader :picture, PictureUploader
end
