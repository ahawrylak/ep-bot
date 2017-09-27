class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :psid, null: false
      t.string :name

      t.timestamps
    end
  end
end
