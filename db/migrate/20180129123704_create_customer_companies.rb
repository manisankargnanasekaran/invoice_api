class CreateCustomerCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_companies do |t|
      t.string :company_name
      t.string :company_code
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.belongs_to :social_network, foreign_key: true
      t.string :location
      t.string :website
      t.string :display_name
      t.string :remarks

      t.timestamps
    end
  end
end
