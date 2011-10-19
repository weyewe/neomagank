class SkillsController < ApplicationController
  def create
    @skill = Skill.new( params[:skill])
    @skill.user_id = current_user.id
    @skill.save
    @profile = current_user.profile
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end

  end
  
  
  def update
    @skill = Skill.find_by_id( params[:id])
    @skill.update_attributes( params[:skill] )
    @profile = current_user.profile
    respond_to do |format|
      format.html { redirect_to root_url}
      format.js
    end
  end
  
  def destroy
    @skill = Skill.find( params[:id] )
    redirect_to( root_url ) and return if params[:cancel]
    @skill_id = @skill.id
    @skill.destroy
    
    respond_to do |format|
      format.html { redirect_to root_url  }
      format.js
    end
  end
  
  
end
