class CreateCustomerContactPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_contact_people do |t|
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.string :department
      t.boolean :is_primary
      t.belongs_to :customer_company, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :address, foreign_key: true

      t.timestamps
    end
  end
end
