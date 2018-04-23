class CustomerContactPersonSerializer < ActiveModel::Serializer
  attributes :id, :salutation, :first_name, :last_name, :department, :is_primary, :contact, :address
  has_one :customer_company
  has_one :organization
  has_one :contact
  has_one :address

  def contact
  	object.contact
  end

   def address
  	object.address
  end
end
