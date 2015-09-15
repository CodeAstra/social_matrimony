class AddAgePreferencesToUserSearchPreferences < ActiveRecord::Migration
  def change
    add_column :user_search_preferences, :age_pref_wt, 	:integer, default: UserSearchPreference::Weights::CARE_LITTLE
    add_column :user_search_preferences, :age_pref_min, :integer
    add_column :user_search_preferences, :age_pref_max, :integer
  end
end
