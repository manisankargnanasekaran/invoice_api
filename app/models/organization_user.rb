class OrganizationUser < ApplicationRecord
  belongs_to :address
  belongs_to :organization_role
  belongs_to :organization
  belongs_to :contact
  # belongs_to :user_login_detail
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contact, allow_destroy: true
  #accepts_nested_attributes_for :user_login_detail, allow_destroy: true
end
