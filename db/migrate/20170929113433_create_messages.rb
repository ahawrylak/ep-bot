class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.text :content, null: false
      t.boolean :delivered, null: false, default: false

      t.timestamps
    end
  end
end
