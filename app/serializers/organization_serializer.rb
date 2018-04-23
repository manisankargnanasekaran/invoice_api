class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :organization_name, :organization_logo, :organization_website, :business_location, :contact, :address
  has_one :contact
  has_one :address
  has_one :tenant
  has_one :business_category
  has_many :organization_accounts

  def contact
 	object.contact
 end

 def address
 	object.address
 end

 def social_network
 	object.social_network
 end
end
