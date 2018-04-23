class CreateExpenseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_categories do |t|
      t.string :name
      t.string :description
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
