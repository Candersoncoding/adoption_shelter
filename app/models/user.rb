class User < ActiveRecord::Base
  has_many :pets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :pets_liked, through: :likes, source: :pet
  has_many :chats
  has_secure_password
  validates :first_name, :last_name, length: {minimum: 2}, presence: true 
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: {minimum: 8}, presence: true, on: :create
  validates :password_confirmation, length: {minimum: 8}, presence: true, on: :create
end
