class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.string :type
      t.string :subject
      t.text :description
      t.string :priority
      t.string :status
      t.string :due_at
      t.integer :submitter_id
      t.integer :assignee_id
      t.integer :organization_id
      t.boolean :has_incidents
      t.string :via

      t.timestamps
    end
  end
end
