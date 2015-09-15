# == Schema Information
#
# Table name: user_search_preferences
#
#  id                 :integer          not null, primary key
#  caste_pref_wt      :integer          default(1)
#  height_pref_min    :integer
#  height_pref_max    :integer
#  height_pref_wt     :integer          default(1)
#  complexion_pref_wt :integer          default(1)
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  age_pref_wt        :integer          default(1)
#  age_pref_min       :integer
#  age_pref_max       :integer
#  complexion_pref    :integer          default(2)
#

require 'test_helper'

class UserSearchPreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
