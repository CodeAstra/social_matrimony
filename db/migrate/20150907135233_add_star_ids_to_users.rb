class AddStarIdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :star_ids, :string, default: ""
  end
end
