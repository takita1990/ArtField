class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :correct_member, only: [:edit,:followers,:follows]
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

  def destroy
    member = current_member
    if member.destroy
      redirect_to root_path
    end
  end

  private
  def member_params
  	params.require(:member).permit(:name, :email, :profile_image, :introduction)
  end

    def correct_member
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to root_path
    end
  end

end
