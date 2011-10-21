class ProfilesController < ApplicationController
  PROFILE_UPDATE_TYPE= [:about_me_update, :personal_details_update, :profile_pic_update]
  def update
    
    @profile = Profile.find_by_id( params[:id]) || current_user.profile
    @profile.update_attributes( params[:profile] )
    
    # @about_me_update = about_me_update?(params)
    
    @update_type = get_update_type(params)
    
    if params[:transloadit] 
      @profile.update_and_extract_transloadit( params )
    end
    
    
    
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  def check_crop_result
     @profile = Profile.find( params[:profile_id])
     hash = {}
     if @profile.is_cropping 
       hash["is_cropping"] = 1 
       hash["cropped_profile_pic"]  = ""
     else
       hash["is_cropping"] = 0 
       hash["cropped_profile_pic"]  = @profile.cropped_profile_pic
     end
     respond_to do |format|
       format.json { render :json => hash }
     end
  end
  
  def crop
    @profile = current_user.profile
    
    @profile.execute_cropping( params[:profile] )
    # current_user.profile.execute_cropping( params[:profile] )

    
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
  
  def get_update_type( params )
    PROFILE_UPDATE_TYPE.each do |t|
      if not  params[t].nil?
        return t
      end
    end
  end
  
end
