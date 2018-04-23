class AddColumnsToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :grand_total, :float
    add_column :invoices, :balance, :float
  end
end
