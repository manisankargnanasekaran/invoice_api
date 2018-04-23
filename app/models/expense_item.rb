class ExpenseItem < ApplicationRecord
  belongs_to :tax
  belongs_to :expense
  belongs_to :expense_category
end
