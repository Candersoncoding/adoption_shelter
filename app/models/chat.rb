class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet
  has_many :users
  validates :comment, length: {minimum: 2}, presence: true
end
