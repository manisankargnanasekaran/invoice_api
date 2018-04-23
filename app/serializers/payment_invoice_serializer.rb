class PaymentInvoiceSerializer < ActiveModel::Serializer
  attributes :id, :invoice_amount, :invoice
  #belongs_to :customer_payment
  
  #belongs_to :invoice
 
  def invoice
   object.invoice
  end
end
