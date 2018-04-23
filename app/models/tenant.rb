class Tenant < ApplicationRecord
	 has_many :user_login_details

	 validates_presence_of :tenant_name, :tenant_location

	 accepts_nested_attributes_for :user_login_details, allow_destroy: true
end
