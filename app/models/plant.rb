class Plant < ApplicationRecord
  validates :name, :description, presence: true
  has_many :user_plants
  has_many :users, through: :user_plants
end
