class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image


  def image
    object.image.url(:medium)
  end
end
