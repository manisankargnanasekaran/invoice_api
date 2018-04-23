class CustomerPayment < ApplicationRecord
	# enum payment_type: {"Invoice Payment" => 0, "Advance Payment" => 1}
	belongs_to :document, optional: true
	belongs_to :organization
	belongs_to :customer_company
	has_many :payment_invoices
	#has_one :invoice
    
	accepts_nested_attributes_for :payment_invoices, allow_destroy: true

end
