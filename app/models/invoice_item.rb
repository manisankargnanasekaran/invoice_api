class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :organization
  belongs_to :tax
  belongs_to :invoice
end
