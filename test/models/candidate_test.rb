# == Schema Information
#
# Table name: candidates
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  gender          :integer
#  birthday        :date
#  hometown        :string
#  location        :string
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  dump_fb_data    :text
#  education       :text
#  work            :text
#  marital_status  :integer
#  gothram         :string
#  height          :integer
#  weight          :integer
#  body_type       :integer
#  complexion      :integer
#  physical_status :integer
#  salary          :integer
#  dosham          :integer
#  star            :integer
#  rashi           :integer
#  food_habits     :integer
#  smoking         :integer
#  drinking        :integer
#  family_type     :integer
#  family_values   :integer
#  family_status   :integer
#  mother_tongue   :integer
#  religion        :integer
#  caste_id        :integer
#  sub_caste_id    :integer
#

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
