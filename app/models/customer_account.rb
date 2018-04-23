class CustomerAccount < ApplicationRecord
  belongs_to :customer_company
  belongs_to :gst_treatment, optional: true
  belongs_to :address, class_name: 'Address', foreign_key: 'shipping_address', optional: true
  
  accepts_nested_attributes_for :address, allow_destroy: true
end
