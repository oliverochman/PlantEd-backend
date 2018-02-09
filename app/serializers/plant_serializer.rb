class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
end
