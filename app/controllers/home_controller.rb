class HomeController < ApplicationController  
  before_action :authenticate_user!, except: [:land]

  def land
    
  end

  def selection_profile
    @user = User.new()
  end

  def welcome
  end

end
