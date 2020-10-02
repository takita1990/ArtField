class WorksController < ApplicationController
  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.member_id = current_member.id
    if @work.save
      redirect_to root_path
    else
      render :new
  end

  def index
    @works = Work.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def about
  end

  def top
  end

  private
  def work_params
    params.require(:work).permit(:name, :introduction, :genre_id, :image_id, :member_id)
  end


end
