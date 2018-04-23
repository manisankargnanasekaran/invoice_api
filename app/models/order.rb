class Order < ApplicationRecord
  belongs_to :estimate, optional: true
  belongs_to :customer_company
  belongs_to :organization
  belongs_to :document, optional: true
  has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true
  accepts_nested_attributes_for :document, allow_destroy: true
  
   
end
