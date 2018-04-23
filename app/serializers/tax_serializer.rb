class TaxSerializer < ActiveModel::Serializer
  attributes :id, :tax_name, :description, :child_tax, :percentage, :tax_category
  has_one :organization
  has_one :tax_type
  has_many :expense_items
end
