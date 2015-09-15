class SubCastesController < ApplicationController
  def index
    @caste = Caste.find(params[:caste_id])
    @sub_castes = @caste.sub_castes
  end
end
