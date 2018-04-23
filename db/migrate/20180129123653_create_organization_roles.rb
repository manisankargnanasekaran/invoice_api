class CreateOrganizationRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_roles do |t|
      t.string :role_name
      t.string :role_code
      t.string :department
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
