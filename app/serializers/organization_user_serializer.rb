class OrganizationUserSerializer < ActiveModel::Serializer
  attributes :id, :salutation, :first_name, :last_name, :gender, :department, :deleted_at, :is_primary
  has_one :address
  has_one :organization_role
  has_one :organization
  has_one :contact
end
