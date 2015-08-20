# == Schema Information
#
# Table name: user_search_preferences
#
#  id                 :integer          not null, primary key
#  caste_pref_wt      :integer
#  height_pref_min    :integer
#  height_pref_max    :integer
#  height_pref_wt     :integer
#  complexion_pref_wt :integer
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class UserSearchPreference < ActiveRecord::Base
  module Weights
    DONT_CARE = 0
    CARE_LITTLE = 1
    IMPORTANT = 2
    DEAL_BREAKER = 3

    def self.all_codes
      [DONT_CARE, CARE_LITTLE, IMPORTANT, DEAL_BREAKER]
    end

    def self.all
      [
        OpenStruct.new(code: DONT_CARE,    title: "I don't care"),
        OpenStruct.new(code: CARE_LITTLE,  title: "I care a little"),
        OpenStruct.new(code: IMPORTANT,    title: "It's important"),
        OpenStruct.new(code: DEAL_BREAKER, title: "It's a deal breaker")
      ]      
    end
  end  

  belongs_to :user

  validates :caste_pref_wt,      presence: true, numericality: true, inclusion: Weights.all_codes
  validates :height_pref_wt,     presence: true, numericality: true, inclusion: Weights.all_codes
  validates :complexion_pref_wt, presence: true, numericality: true, inclusion: Weights.all_codes
  # validates :height_pref_min,    presence: true, numericality: true, if: :height_preferred?
  # validates :height_pref_max,    presence: true, numericality: true, if: :height_preferred?

  def height_preferred?
    self.height_pref_wt != Weights::DONT_CARE
  end
end
