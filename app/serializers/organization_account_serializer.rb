class OrganizationAccountSerializer < ActiveModel::Serializer
  attributes :id, :fiscal_year_start_month, :currency_code, :currency_symbol
  has_one :organization
end
