class CreateUserPlants < ActiveRecord::Migration[5.0]
  def change
    create_table :user_plants do |t|
      t.belongs_to :user, index: true
      t.belongs_to :plant, index: true

      t.timestamps
    end
  end
end