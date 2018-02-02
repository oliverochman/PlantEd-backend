class UserPlantSerializer < ActiveModel::Serializer
  attributes :plant
  belongs_to :user

  def plant
   # object.plant.map do |plant|
      PlantSerializer.new(object.plant).as_json
   # end
  end

  def user
    UserSerializer.new(object.user).as_json
  end
end
