class SkillsController < ApplicationController
  def create
    @skill = Skill.new( params[:skill])
    @skill.user_id = current_user.id
    @skill.save
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end

  end
  
  
  def update
    @skill = Skill.find_by_id( params[:id])
    @skill.update_attributes( params[:skill] )
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
end
