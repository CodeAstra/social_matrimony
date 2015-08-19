# == Schema Information
#
# Table name: candidates
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  gender     :string
#  birthday   :date
#  hometown   :string
#  location   :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Candidate < ActiveRecord::Base

  belongs_to :user

end
