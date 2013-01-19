class SkillsUsersController < ApplicationController
  def destroy
    user = User.find(params[:user_id])
    skill = Skill.find(params[:id])

    user.skills.delete(skill)
    flash[:notice] = "skill #{skill} removed"
    redirect_to user
  end
end
