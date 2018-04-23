class CreateCustomerPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_payments do |t|
      t.string :payment_mode
      t.datetime :payment_date
      t.string :reference_number
      t.string :description
      t.float :transaction_charges
      t.boolean :payment_type
      t.float :amount
      t.belongs_to :document, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :customer_company, foreign_key: true

      t.timestamps
    end
  end
end
