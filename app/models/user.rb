class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, length: { minimum: 6, maximum: 50 }
  validates :password, presence: true, length: { minimum: 6, maximum: 50 }
end
