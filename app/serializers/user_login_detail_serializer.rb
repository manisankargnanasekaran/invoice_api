class UserLoginDetailSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :deleted_at
  has_one :organization_user
  has_one :tenant
end
