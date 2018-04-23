class ExpenseItemSerializer < ActiveModel::Serializer
  attributes :id, :expense_type, :expense_code, :particular, :tax_id, :description, :amount, :tax, :expense_category
  has_one :tax
  has_one :expense
  has_one :expense_category
  def tax
  	object.tax
  end
  def expense_category
  	object.expense_category
  end
end
