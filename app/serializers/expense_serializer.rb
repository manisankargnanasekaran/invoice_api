class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :expenses_date, :item_wise, :expenses_type, :expenses_code, :amount, :gst_number, :vendor_invoice_number, :remarks, :expenses_number
  has_one :expense_category
  has_one :gst_treatment
  has_one :place_of_supply
  has_one :tax
  has_one :customer_company
  has_one :document
  has_many :expense_items
end

