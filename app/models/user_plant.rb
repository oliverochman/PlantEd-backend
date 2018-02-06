class UserPlant < ApplicationRecord
  include IceCube

  belongs_to :user
  belongs_to :plant

  validates_presence_of :user_id, :plant_id

  def schedule
    Schedule.new(start_date) do |s|
      s.add_recurrence_rule Rule.daily(self.frequency).until(Date.today + 30)
    end
  end
end
