class AddColumnsToExpense < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :item_wise, :boolean
  end
end
