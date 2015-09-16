class HomeController < ApplicationController  
  before_action :authenticate_user!, except: [:land]

  def land
    
  end

  def selection_profile
    @user = User.new()
  end

  def welcome
    if current_candidate.caste
      @sub_castes = current_candidate.caste.sub_castes.all
    else
      @sub_castes = []
    end
  end

end
