class Expense < ApplicationRecord
  belongs_to :expense_category, optional: true
  belongs_to :gst_treatment
  belongs_to :place_of_supply
  belongs_to :tax, optional: true
  belongs_to :customer_company
  belongs_to :document, optional: true
  has_many :expense_items

  accepts_nested_attributes_for :expense_items, allow_destroy: true
  
end
