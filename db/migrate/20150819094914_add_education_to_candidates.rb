class AddEducationToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :education, :text
  end
end
