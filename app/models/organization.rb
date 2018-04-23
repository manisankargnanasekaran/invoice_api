class Organization < ApplicationRecord
  belongs_to :contact
  belongs_to :address
  belongs_to :tenant
  belongs_to :business_category
  has_many :organization_accounts
  has_many :invoices
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :business_category, allow_destroy: true
  accepts_nested_attributes_for :contact, allow_destroy: true
  accepts_nested_attributes_for :organization_accounts, allow_destroy: true
end
