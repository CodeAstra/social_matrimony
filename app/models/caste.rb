# == Schema Information
#
# Table name: castes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Caste < ActiveRecord::Base
  has_many :sub_castes

  validates :name, presence: true
end
