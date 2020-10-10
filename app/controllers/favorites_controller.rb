class FavoritesController < ApplicationController
  def create
    @work = Work.find(params[:work_id])
  	favorite = current_member.favorites.build(work_id: params[:work_id], member_id: current_member.id)
    favorite.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @work = Work.find(params[:work_id])
  	favorite = Favorite.find_by(work_id: params[:work_id], member_id: current_member.id)
    favorite.destroy
    #redirect_back(fallback_location: root_path)
  end
end
