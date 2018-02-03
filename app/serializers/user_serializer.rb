class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :plants

  def plants
    object.plants.map do |plant|
      PlantSerializer.new(plant).as_json
    end
  end
end
