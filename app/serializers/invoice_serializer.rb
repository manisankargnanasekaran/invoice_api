class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :invoice_prefix, :invoice_number, :grand_total, :balance, :payment_terms, :discount_total, :due_date, :discount_total, :invoice_date, :payment_status, :sub_total, :tax_total, :shipping_charge, :adjustment_charge, :adjustment_description, :place_of_supply, :customer_company, :invoice_item
  belongs_to :customer_company
  has_one :organization
  has_one :estimate
  has_one :order
  has_many :invoice_items
  has_one :document

  def invoice_item
     object.invoice_items
  end
end
