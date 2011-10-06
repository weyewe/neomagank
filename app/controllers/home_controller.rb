class HomeController < ApplicationController
  def show
    @profile = current_user.profile
    @work_experience = WorkExperience.new
    @skill = Skill.new
    @education = Education.new
  end
  
  def show_public
  end
end
