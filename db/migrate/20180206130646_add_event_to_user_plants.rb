class AddEventToUserPlants < ActiveRecord::Migration[5.0]
  def change
    add_column :user_plants, :anchor, :date
    add_column :user_plants, :frequency, :integer
  end
end
