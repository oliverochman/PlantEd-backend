class Plant < ApplicationRecord
  validates :name, :description, presence: true
end
