class CreateTaxTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_types do |t|
      t.string :tax_type
      t.integer :tax_division

      t.timestamps
    end
  end
end
