class WorkExperiencesController < ApplicationController
  def create
    @work_experience = WorkExperience.new( params[:work_experience])
    @work_experience.user_id = current_user.id
    @work_experience.save
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end

  end
  
  
  def update
    @work_experience = WorkExperience.find_by_id( params[:id])
    @work_experience.update_attributes( params[:work_experience] )
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  def destroy
    @work_experience = WorkExperience.find( params[:id] )
    redirect_to( root_url ) and return if params[:cancel]
    @work_experience_id = @work_experience.id
    @work_experience.destroy
    
    respond_to do |format|
      format.html { redirect_to root_url  }
      format.js
    end
  end

  
  
  
end