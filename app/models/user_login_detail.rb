class UserLoginDetail < ApplicationRecord
	belongs_to :tenant
	belongs_to :organization_user, optional: true

	validates_presence_of :email, :password_digest
	validates :email, uniqueness: true

	#encrypt password
	has_secure_password
	# accepts_nested_attributes_for :tenant
end