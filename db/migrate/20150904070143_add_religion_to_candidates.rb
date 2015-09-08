class AddReligionToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :mother_tongue, :integer
    add_column :candidates, :religion, :integer
  end
end
