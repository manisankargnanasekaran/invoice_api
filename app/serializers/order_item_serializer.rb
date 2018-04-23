class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :cost_of_item, :no_of_items
  belongs_to :item
  belongs_to :order
end
