class EducationsController < ApplicationController
  def create
    @education = Education.new( params[:education])
    @education.user_id = current_user.id
    @education.save
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end

  end
  
  
  def update
    @education = Education.find_by_id( params[:id])
    @education.update_attributes( params[:education] )
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
end
