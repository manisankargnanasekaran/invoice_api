class OrganizationRoleSerializer < ActiveModel::Serializer
  attributes :id, :role_name, :role_code, :department
  has_one :organization
end
