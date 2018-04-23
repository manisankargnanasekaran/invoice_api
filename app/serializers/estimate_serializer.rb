class EstimateSerializer < ActiveModel::Serializer
  attributes :id, :estimete_number, :date_of_estimete, :expiry_date, :name_of_estimate, :message, :discount_name, :discount_percentage, :terms_and_condition, :remarks, :estimate_status
  has_one :customer_company
  has_one :organization
  has_one :organization_user
  has_one :customer_contact_person
end
