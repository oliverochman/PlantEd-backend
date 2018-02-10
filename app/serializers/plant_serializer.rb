class PlantSerializer < ActiveModel::Serializer
  attributes :name, :description, :image


  def image
    object.image.url(:medium)
  end
end
