class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates_presence_of :user_id, :plant_id
end
