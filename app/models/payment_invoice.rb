class PaymentInvoice < ApplicationRecord
  belongs_to :customer_payment
  belongs_to :invoice
end
