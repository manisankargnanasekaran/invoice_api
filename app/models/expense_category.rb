class ExpenseCategory < ApplicationRecord
  belongs_to :organization
  has_many :expense_items
end
