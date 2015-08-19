# == Schema Information
#
# Table name: candidates
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  gender       :integer
#  birthday     :date
#  hometown     :string
#  location     :string
#  image        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  dump_fb_data :text
#  education    :text
#  work         :text
#

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
