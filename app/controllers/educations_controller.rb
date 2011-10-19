class EducationsController < ApplicationController
  def create
    @education = Education.new( params[:education])
    @education.user_id = current_user.id
    @education.save
    @profile = current_user.profile
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end

  end
  
  
  def update
    @education = Education.find_by_id( params[:id])
    @education.update_attributes( params[:education] )
    @profile  = current_user.profile
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  def destroy
    @education = Education.find( params[:id] )
    redirect_to( root_url ) and return if params[:cancel]
    @education_id = @education.id
    @education.destroy
    
    respond_to do |format|
      format.html { redirect_to root_url  }
      format.js
    end
  end
  
  
end
