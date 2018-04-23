class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.datetime :expenses_date
      t.boolean :expenses_type
      t.string :expenses_code
      t.float :amount
      t.string :gst_number
      t.string :vendor_invoice_number
      t.string :remarks
      t.string :expenses_number
      t.references :expense_category, foreign_key: true
      t.references :gst_treatment, foreign_key: true
      t.references :place_of_supply, foreign_key: true
      t.references :tax, foreign_key: true
      t.references :customer_company, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
