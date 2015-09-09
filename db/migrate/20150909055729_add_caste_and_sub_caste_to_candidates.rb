class AddCasteAndSubCasteToCandidates < ActiveRecord::Migration
  def change
    add_reference :candidates, :caste, index: true
    add_foreign_key :candidates, :castes
    add_reference :candidates, :sub_caste, index: true
    add_foreign_key :candidates, :sub_castes
  end
end
