class Plant < ApplicationRecord
  validates :name, :description, presence: true
  has_many :user_plants
  has_many :users, through: :user_plants

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: ['image/jpeg']
end
