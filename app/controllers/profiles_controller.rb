class ProfilesController < ApplicationController
  def update
    @profile = Profile.find_by_id( params[:id])
    @profile.update_attributes( params[:profile] )
    
    @about_me_update = about_me_update?(params)
    
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  protected
  def about_me_update?(params)
    if params[:about_me_update].nil?
      return false
    else
      return true
    end
  end
end
