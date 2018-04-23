class CreateGstTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :gst_treatments do |t|
      t.string :name
      t.string :description
      t.boolean :gst_required

      t.timestamps
    end
  end
end
