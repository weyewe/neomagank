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
end
