class HomeController < ApplicationController
  def show
    @profile = current_user.profile
  end
end
