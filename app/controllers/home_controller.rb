class HomeController < ApplicationController  
  before_action :authenticate_user!, except: [:land]

  def land
  end

  def welcome
  end
end
