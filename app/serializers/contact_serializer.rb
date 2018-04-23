class ContactSerializer < ActiveModel::Serializer
  attributes :id, :email, :mobile, :fax, :is_primary
end
