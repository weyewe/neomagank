class JobsController < ApplicationController
  
  def index
    @profile = current_user.profile
  end
  
  def create
  end
  
  def update
  end
end
