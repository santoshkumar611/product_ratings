class ProductSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :thumbnail_image, :overall_rating
end