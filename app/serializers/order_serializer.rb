class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_date, :order_number, :remarks

  belongs_to :estimate
  belongs_to :customer_company
  belongs_to :organization
  has_many :order_items
  belongs_to :document
end
