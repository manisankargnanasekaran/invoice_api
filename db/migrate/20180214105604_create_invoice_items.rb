class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.float :tax_cost
      t.string :description
      t.integer :number_of_item
      t.integer :cost_of_item
      t.float :sub_total
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :tax, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.belongs_to :invoice, foreign_key: true
      t.float :discount_amount
      t.float :discount_percentage

      t.timestamps
    end
  end
end
