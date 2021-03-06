class RelationshipsController < ApplicationController
  before_action :authenticate_member!
 def create
 	@member = Member.find(params[:member_id])
    follow = current_member.active_relationships.build(follower_id: params[:member_id])
    follow.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
  	@member = Member.find(params[:member_id])
    follow = current_member.active_relationships.find_by(follower_id: params[:member_id])
    follow.destroy
    #redirect_back(fallback_location: root_path)
  end
end
