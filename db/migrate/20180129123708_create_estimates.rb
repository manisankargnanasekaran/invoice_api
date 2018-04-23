class CreateEstimates < ActiveRecord::Migration[5.1]
  def change
    create_table :estimates do |t|
      t.string :estimate_number
      t.datetime :date_of_estimete
      t.datetime :expiry_date
      t.string :name_of_estimate
      t.string :message
      t.string :discount_name
      t.float :discount_percentage
      t.string :terms_and_condition
      t.string :remarks
      t.integer :estimate_status
      t.belongs_to :customer_company, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :organization_user, foreign_key: true
      t.belongs_to :customer_contact_person, foreign_key: true
      t.belongs_to :document, foreign_key: true
      t.timestamps
    end
  end
end
