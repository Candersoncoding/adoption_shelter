class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  has_many :skills, dependent: :destroy
  has_many :chats, dependent: :destroy
  validates :name, :kind, :breed, :color, presence: true
  validates :age, presence: true
  validates :image_url, url: true, presence: true
end
