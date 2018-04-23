class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :document_name
      t.string :url
      t.string :document_type

      t.timestamps
    end
  end
end
