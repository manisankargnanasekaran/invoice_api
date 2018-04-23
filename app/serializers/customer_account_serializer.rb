class CustomerAccountSerializer < ActiveModel::Serializer
  attributes :id, :tin, :gst_no, :tan, :pan, :currency, :payment_terms, :taxable, :tax_exempt_reason, :place_of_supply, :shipping_address

  has_one :customer_company
  has_one :gst_treatment

  def shipping_address
  object.address
  end
end
