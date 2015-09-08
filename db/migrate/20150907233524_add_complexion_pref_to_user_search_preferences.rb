class AddComplexionPrefToUserSearchPreferences < ActiveRecord::Migration
  def change
    add_column :user_search_preferences, :complexion_pref, :integer, default: Candidate::COMPLEXION.code_of(:fair)
  end
end
