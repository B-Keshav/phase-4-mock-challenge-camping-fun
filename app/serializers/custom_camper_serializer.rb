class CustomCamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :activities

  def activities
    object.activities
  end
end
