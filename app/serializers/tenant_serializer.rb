class TenantSerializer < ActiveModel::Serializer
  attributes :id, :tenant_name, :tenant_location, :deleted_at
end
