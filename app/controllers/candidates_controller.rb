class CandidatesController < ApplicationController

  def update
    @candidate = current_candidate
    @save_success =  @candidate.update_attributes(personalinfo_params)
  end

private
  def personalinfo_params
    params.require(:candidate).permit(:marital_status,:caste,:subcaste,:gothram,:height,:weight,
                                      :body_type,:complexion,:physical_status,:salary,:food,
                                      :smoke,:drink,:dosham,:star,:rashi,:family_type,
                                      :family_values,:family_status) 
  end
end
