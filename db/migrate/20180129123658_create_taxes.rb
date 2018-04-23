class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
      t.string :tax_name
      t.string :description
      t.float :percentage
      t.text :child_tax, array: true, default: []
      t.boolean :tax_category
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :tax_type, foreign_key: true

      t.timestamps
    end
  end
end
