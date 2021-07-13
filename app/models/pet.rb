class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  has_many :skills, dependent: :destroy
  validates :name, :kind, :breed, :color, length: {minimum: 2}, presence: true, on: :create
  validates :age, presence: true, on: :create
end
