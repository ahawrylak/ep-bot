class ChangePsidFormatInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :psid, :bigint
  end
end
