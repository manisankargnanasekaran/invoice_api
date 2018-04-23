class CustomerCompany < ApplicationRecord
  belongs_to :organization
  belongs_to :contact, :dependent => :destroy
  belongs_to :address, :dependent => :destroy
  belongs_to :social_network, optional: true, :dependent => :destroy
  has_many :customer_contact_people, ->{ order(id: :asc) }, :dependent => :destroy
  has_many :invoices
  has_one :customer_account, :dependent => :destroy
  has_many :customer_payments
  

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contact, allow_destroy: true
  accepts_nested_attributes_for :social_network, allow_destroy: true
  accepts_nested_attributes_for :customer_contact_people, allow_destroy: true
  accepts_nested_attributes_for :customer_account, allow_destroy: true
end
