class EstimateItemSerializer < ActiveModel::Serializer
  attributes :id, :cost_of_item, :quantity, :remarks
  has_one :item
  has_one :estimate
end
