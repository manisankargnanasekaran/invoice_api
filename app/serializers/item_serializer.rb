class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :product_type, :cost_of_item, :code, :deleted_at
  has_one :unit
  has_one :organization
  has_one :order_item
  has_many :tax_items
  has_many :invoice_items
end
