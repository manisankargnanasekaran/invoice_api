class CustomerCompanySerializer < ActiveModel::Serializer
  attributes :id, :company_name, :company_code, :location, :website, :display_name, :remarks, :organization, :contact, :address, :social_network, :customer_contact_people, :customer_account, :customer_account
  has_one :organization
  has_one :contact
  has_one :address
  has_one :social_network
  has_many :customer_contact_people
  has_one :customer_account
  has_many :invoices

 def organization
 	object.organization
 end

 def contact
 	object.contact
 end

 def address
 	object.address
 end

 def social_network
 	object.social_network
 end

 def customer_account
 	object.customer_account
 end
end




