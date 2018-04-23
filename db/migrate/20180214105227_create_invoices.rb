class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_prefix
      t.integer :invoice_number
      t.string :payment_terms
      t.date :due_date
      t.date :invoice_date
      t.belongs_to :customer_company, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :estimate, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.belongs_to :document, foreign_key: true
      t.integer :payment_status
      t.float :sub_total
      t.float :tax_total
      t.float :shipping_charge
      t.float :adjustment_charge
      t.string :adjustment_description
      t.string :place_of_supply
      t.string :remarks
      t.float :discount_total

      t.timestamps
    end
  end
end
