class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :mobile
      t.string :fax
      t.boolean :is_primary

      t.timestamps
    end
  end
end
