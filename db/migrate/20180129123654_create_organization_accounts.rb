class CreateOrganizationAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_accounts do |t|
      t.string :fiscal_year_start_month
      t.string :currency_code
      t.string :currency_symbol
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
