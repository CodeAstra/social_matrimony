class AddWorkToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :work, :text
  end
end
