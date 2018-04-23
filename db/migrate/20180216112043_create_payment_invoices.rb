class CreatePaymentInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_invoices do |t|
      t.belongs_to :customer_payment, foreign_key: true
      t.belongs_to :invoice, foreign_key: true
      t.float :invoice_amount
      t.timestamps
    end
  end
end
