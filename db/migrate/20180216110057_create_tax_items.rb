class CreateTaxItems < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_items do |t|
      t.belongs_to :tax, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.float :percentage

      t.timestamps
    end
  end
end
