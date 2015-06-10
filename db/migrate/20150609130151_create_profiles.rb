class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :first_name
      t.text :last_name

      t.timestamps null: false
    end
  end
end
