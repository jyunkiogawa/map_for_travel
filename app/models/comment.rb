class Comment < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  validates :content, presence: true
  # validates :image, presence: true
end
