class CreateEstimateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :estimate_items do |t|
      t.float :cost_of_item
      t.integer :quantity
      t.string :remarks
      t.belongs_to :item, foreign_key: true
      t.belongs_to :estimate, foreign_key: true

      t.timestamps
    end
  end
end
