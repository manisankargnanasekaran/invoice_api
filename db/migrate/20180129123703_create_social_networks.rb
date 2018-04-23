class CreateSocialNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :social_networks do |t|
      t.string :facebook
      t.string :google_plus
      t.string :skype
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
