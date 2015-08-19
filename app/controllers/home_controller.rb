class HomeController < ApplicationController

  # rails g controller home land
  
  def land
    
  end

  def selection_profile
    @user = User.new()
  end
end
