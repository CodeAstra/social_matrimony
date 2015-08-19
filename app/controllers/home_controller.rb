class HomeController < ApplicationController  
  before_action :authenticate_user!, except: [:land]

  def land
  end

  def welcome
    @candidate = current_user.candidate
  end
end
