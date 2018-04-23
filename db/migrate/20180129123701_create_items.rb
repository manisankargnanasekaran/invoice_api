class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :product_type
      t.float :cost_of_item
      t.string :code
      t.datetime :deleted_at
      t.belongs_to :unit, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :tax, foreign_key: true

      t.timestamps
    end
    add_index :items, :deleted_at
  end
end
