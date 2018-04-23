class Tax < ApplicationRecord
  belongs_to :organization
  belongs_to :tax_type
  has_many :tax_items
  has_many :expense_items
end
