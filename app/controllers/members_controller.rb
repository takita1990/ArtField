class MembersController < ApplicationController
  def show
  	@member = current_member
  end

  def edit
  	@member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path
    else
      render :edit
    end
  end

  private
  def member_params
  	params.require(:member).permit(:name, :email, :profile_image, :introduction)
  end

end
