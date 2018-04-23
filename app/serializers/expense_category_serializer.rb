class ExpenseCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :organization
end
