class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.string :name
      t.string :alias
      t.string :locale
      t.string :timezone
      t.string :email
      t.string :phone
      t.string :signature
      t.string :suspended
      t.string :role
      t.string :last_login_at
      t.boolean :active
      t.boolean :verified
      t.boolean :shared
      t.integer :organization_id

      t.timestamps
    end
  end
end
