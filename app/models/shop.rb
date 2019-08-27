class Shop < ApplicationRecord
  validates :description, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :name, presence: true
  validates :kind_id, presence: true
  
  mount_uploader :image, ImageUploader
  belongs_to :kind
  has_many :comments, dependent: :destroy
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end
