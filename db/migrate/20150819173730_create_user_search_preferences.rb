class CreateUserSearchPreferences < ActiveRecord::Migration
  def change
    create_table :user_search_preferences do |t|
      t.integer    :caste_pref_wt, default: UserSearchPreference::Weights::CARE_LITTLE

      t.integer    :height_pref_min
      t.integer    :height_pref_max
      t.integer    :height_pref_wt, default: UserSearchPreference::Weights::CARE_LITTLE

      t.integer    :complexion_pref_wt, default: UserSearchPreference::Weights::CARE_LITTLE

      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_search_preferences, :users
  end
end
