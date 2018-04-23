class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :organization_name
      t.string :organization_logo
      t.string :organization_website
      t.string :business_location
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.belongs_to :tenant, foreign_key: true
      t.belongs_to :business_category, foreign_key: true

      t.timestamps
    end
  end
end
