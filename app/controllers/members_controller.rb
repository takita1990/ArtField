class MembersController < ApplicationController
  before_action :authenticate_member!
  def show
  	@member = Member.find(params[:id])
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

  def follows
    member = Member.find(params[:id])
    @followings_member = member.followings
  end

  def followers
    member = Member.find(params[:id])
    @followers_member = member.followers
  end

  private
  def member_params
  	params.require(:member).permit(:name, :email, :profile_image, :introduction)
  end

end
