class RemoveCasteAndSubCastePlaceholderColumnsFromCandidates < ActiveRecord::Migration
  def change
    remove_column :candidates, :caste, :integer
    remove_column :candidates, :sub_caste, :integer
  end
end
