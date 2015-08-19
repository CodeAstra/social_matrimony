class AddUserToCandidates < ActiveRecord::Migration
  def change
    add_reference :candidates, :user, index: true
    add_foreign_key :candidates, :users
  end
end
