class AddDumpFbDataToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :dump_fb_data, :text
  end
end
