class Invoice < ApplicationRecord
  belongs_to :customer_company
  belongs_to :organization
  belongs_to :estimate, optional: true
  belongs_to :order, optional: true
  belongs_to :document, optional: true
  has_many :invoice_items, :dependent => :destroy
  
  enum payment_status: {"UnPaid" => 1, "Paid" => 2, "Partially Paid" => 3}


  accepts_nested_attributes_for :invoice_items, allow_destroy: true
  accepts_nested_attributes_for :document, allow_destroy: true



end
