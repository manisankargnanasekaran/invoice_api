class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :tenant_name
      t.string :tenant_location
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tenants, :deleted_at
  end
end
