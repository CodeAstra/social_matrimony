class CandidatesController < ApplicationController
  before_action :fetch_candidate, only: [:star, :unstar]

  def update
    @candidate = current_candidate
    @save_success =  @candidate.update_attributes(personalinfo_params)
  end

  def index
    @matches = current_candidate.matches
  end

  def star
    current_user.star_candidate(@candidate)
    render :reload
  end

  def unstar
    current_user.unstar_candidate(@candidate)
    render :reload
  end

private
  def personalinfo_params
    params.require(:candidate).permit(:marital_status,:mother_tongue,:religion,:caste_id,:sub_caste_id,:gothram,:height,:weight,
                                      :body_type,:complexion,:physical_status,:salary,:food_habits,
                                      :smoking,:drinking,:dosham,:star,:rashi,:family_type,
                                      :family_values,:family_status) 
  end

  def fetch_candidate
    @candidate = Candidate.find(params[:id])
  end
end
