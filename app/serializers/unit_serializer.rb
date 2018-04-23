class UnitSerializer < ActiveModel::Serializer
  attributes :id, :unit_short_code, :unit_name
  has_one :item
end
