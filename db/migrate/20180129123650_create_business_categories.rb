class CreateBusinessCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :business_categories do |t|
      t.string :business_category_name
      t.string :business_category_code

      t.timestamps
    end
  end
end
