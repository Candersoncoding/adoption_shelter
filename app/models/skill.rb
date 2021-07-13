class Skill < ActiveRecord::Base
  belongs_to :pet
  validates :talent, presence: true, length: {minimum: 2}, on: :create
end
