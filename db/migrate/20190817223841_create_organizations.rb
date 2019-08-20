class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.string :name
      t.string :details
      t.boolean :shared_tickets

      t.timestamps
    end
  end
end
