class HomeController < ApplicationController
  
  skip_filter :authenticate_user!, :only => [ :show_public]
  
  
  def show
    @profile = current_user.profile
    @work_experience = WorkExperience.new
    @skill = Skill.new
    @education = Education.new
  end
  
  def show_public
    @profile = Profile.find( params[:model_id] )
    @user = @profile.user
    @work_experiences = @user.work_experiences
    @skills = @user.skills
    @educations = @user.educations
  end
end
