class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_candidate

  def current_candidate
    current_user.try(:candidate)
  end

  def new_session_path(scope)
    root_path
  end

  def update
    current_candidate.update_attributes(personalinfo_params)
    current_candidate.save!
  end

private
  def personalinfo_params
   params.require(:current_candidate).permit(:marital_status,:caste,:subcaste,:gothram,:height,:weight,
                                                  :bodytype,:complexion,:physicalstatus,:salary,:food,
                                                  :smoke,:drink,:dosham,:star,:rashi,:familytype,
                                                  :familyvalues,:familystatus) 
  end
end
