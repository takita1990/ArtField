class WorksController < ApplicationController
	before_action :authenticate_member!,except: [:index]

  def index
  	@search_genre = Genre.where(id: params[:genre_id],valid_status:true)
  	@genres = Genre.all
    @works = Work.joins(:genre).where("genres.valid_status = ?",true)
    #byebug
  end

  def show
    @work = Work.find(params[:id])
    @post_comment = PostComment.new
  end

end
