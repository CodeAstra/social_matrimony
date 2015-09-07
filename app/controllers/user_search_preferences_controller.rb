class UserSearchPreferencesController < ApplicationController
  def update
    @user_search_preference = current_user.user_search_preference
    @user_search_preference.update_attributes(preference_params)
    redirect_to matches_path
  end
  
private
  def preference_params
    params.require(:user_search_preference).permit(:caste_pref_wt,:age_pref_wt,
                                                    :age_pref_min,:age_pref_max,:height_pref_wt,
                                                    :height_pref_min,:height_pref_max,
                                                    :complexion_pref_wt)
  end
end
