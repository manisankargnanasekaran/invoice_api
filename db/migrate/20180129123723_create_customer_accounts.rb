class CreateCustomerAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_accounts do |t|
      t.belongs_to :customer_company, foreign_key: true
      t.string :tin
      t.string :gst_no
      t.string :tan
      t.string :pan
      t.belongs_to :gst_treatment, foreign_key: true
      t.float :currency
      t.string :payment_terms
      t.boolean :taxable
      t.string :tax_exempt_reason
      t.string :place_of_supply
      t.integer :shipping_address

      t.timestamps
    end
  end
end
