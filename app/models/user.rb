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
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

