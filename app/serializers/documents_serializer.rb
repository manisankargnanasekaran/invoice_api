class DocumentsSerializer < ActiveModel::Serializer
  attributes :id, :document_name, :url, :document_type
  has_one :order
  has_one :estimate
  has_one :invoice
  has_one :customer_payment
end
