class HomeController < ApplicationController
  def show
    @profile = current_user.profile
    @work_experience = WorkExperience.new
  end
end
