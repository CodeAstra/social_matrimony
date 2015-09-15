class AddIgnoreIdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ignore_ids, :string, default: ""
  end
end
