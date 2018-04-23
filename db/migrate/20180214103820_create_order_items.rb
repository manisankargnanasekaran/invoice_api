class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :item, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.integer :cost_of_item
      t.integer :no_of_items

      t.timestamps
    end
  end
end
