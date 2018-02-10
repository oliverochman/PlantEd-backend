class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :plants

  def plants
    object.user_plants.map do |plant|
      UserPlantsSerializer.new(plant).as_json
    end
  end
end
