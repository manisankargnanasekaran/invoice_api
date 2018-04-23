class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :estimate, foreign_key: true
      t.belongs_to :customer_company, foreign_key: true
      t.datetime :order_date
      t.integer :order_number
      t.string :remarks
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :document, foreign_key: true

      t.timestamps
    end
  end
end
