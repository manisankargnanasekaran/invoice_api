class InvoicePdf < Prawn::Document
	def initialize(invoice)
    super(top_margin: 70)
   @invoice = invoice
   invoice_customer
  end

  def invoice_customer

  	text "#{@invoice.customer_company.company_name}", size: 10, style: :bold, :align => :right
  	text "#{@invoice.customer_company.address.address_line1}", size: 10
  	text "#{@invoice.customer_company.address.city}", size: 10
  	text "#{@invoice.customer_company.address.country}", size: 10

   
  end
end