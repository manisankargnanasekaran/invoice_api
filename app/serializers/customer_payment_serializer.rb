class CustomerPaymentSerializer < ActiveModel::Serializer
  attributes :id, :payment_mode, :payment_date, :amount, :reference_number, :description, :transaction_charges, :payment_type, :payment_date
	has_many :payment_invoices
	#has_one :invoice

end
