class AddAttachmentImageToPlants < ActiveRecord::Migration
  def self.up
    change_table :plants do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :plants, :image
  end
end
