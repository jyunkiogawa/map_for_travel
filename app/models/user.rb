class User < ApplicationRecord
  validates :name, presence: true,length: { maximum: 15 }
  
  validates :email, presence: true,
                      format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
                      
  has_secure_password

  validates :password,presence: true,
                      length: { minimum: 8, maximum: 28 },
                      format: { with: /\A[a-zA-Z0-9]+\z/ }
                      
  has_many :shops
  has_many :comments
  
  has_many :favorites
  has_many :favorite_shops, through: :favorites, source: 'shop'
end

