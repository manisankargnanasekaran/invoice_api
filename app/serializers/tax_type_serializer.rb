class TaxTypeSerializer < ActiveModel::Serializer
  attributes :id, :tax_type, :tax_division
  has_many :taxes
end
