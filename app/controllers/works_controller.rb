class WorksController < ApplicationController
	before_action :authenticate_member!,except: [:index]

  def index
  	@search_genre = Genre.where(id: params[:genre_id],valid_status:true)
  	@genres = Genre.all
    @works = Work.joins(:genre).where("genres.valid_status = ?",true)
    @all_ranks = Work.find(Favorite.group(:work_id).order('count(work_id) desc').limit(3).pluck(:work_id))
  end

  def show
    @work = Work.find(params[:id])
    @post_comment = PostComment.new
  end

end
