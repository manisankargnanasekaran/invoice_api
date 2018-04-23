class CreateUserLoginDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_login_details do |t|
      t.string :email
      t.string :password_digest
      t.datetime :deleted_at
      t.belongs_to :organization_user, foreign_key: true
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
    add_index :user_login_details, :deleted_at
  end
end
