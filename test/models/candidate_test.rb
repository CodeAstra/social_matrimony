# == Schema Information
#
# Table name: candidates
#
#  id             :integer          not null, primary key
#  name           :string
#  email          :string
#  gender         :integer
#  birthday       :date
#  hometown       :string
#  location       :string
#  image          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  dump_fb_data   :text
#  education      :text
#  work           :text
#  marital_status :integer
#  caste          :integer
#  subcaste       :integer
#  gothram        :string
#  height         :string
#  weight         :string
#  bodytype       :integer
#  complexion     :integer
#  physicalstatus :integer
#  salary         :string
#  food           :integer
#  smoke          :integer
#  drink          :integer
#  dosham         :integer
#  star           :string
#  rashi          :string
#  familytype     :integer
#  familyvalues   :integer
#  familystatus   :integer
#

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
