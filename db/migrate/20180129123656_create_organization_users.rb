class CreateOrganizationUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_users do |t|
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.boolean :gender
      t.string :department
      t.datetime :deleted_at
      t.boolean :is_primary
      t.belongs_to :address, foreign_key: true
      t.belongs_to :organization_role, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end
    add_index :organization_users, :deleted_at
  end
end
