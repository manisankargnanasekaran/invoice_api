class CreateExpenseItems < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_items do |t|
      t.boolean :expense_type
      t.string :expense_code
      t.string :particular
      t.string :description
      t.float :amount
      t.references :tax, foreign_key: true
      t.references :expense, foreign_key: true
      t.references :expense_category, foreign_key: true

      t.timestamps
    end
  end
end
