class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :user_plants
  has_many :plants, through: :user_plants
  has_many :notifications
end
