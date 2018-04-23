class CreatePlaceOfSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :place_of_supplies do |t|
      t.string :place_name

      t.timestamps
    end
  end
end
