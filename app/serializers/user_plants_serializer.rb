class UserPlantsSerializer < ActiveModel::Serializer
  attributes :id, :plant, :frequency

  def plant
    PlantSerializer.new(object.plant).as_json
  end
end
