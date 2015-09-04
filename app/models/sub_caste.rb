# == Schema Information
#
# Table name: sub_castes
#
#  id         :integer          not null, primary key
#  name       :string
#  caste_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SubCaste < ActiveRecord::Base
  belongs_to :caste

  validates :name,  presence: true
  validates :caste, presence: true
end
