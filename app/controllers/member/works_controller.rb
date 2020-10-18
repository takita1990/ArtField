class Member::WorksController < ApplicationController
  before_action :authenticate_member!,except: [:top, :about]
  before_action :correct_work, only: [:edit]

  def top
  end

  def about
  end

  def new
    @work = Work.new
  end

  def show
    @member = current_member
    @favorite_works = @member.favorite_works
  end

  def create
    @work = Work.new(work_params)
    @work.member_id = current_member.id
    if @work.save
        @work.image.each do |img|
          tags = Vision.get_image_data(img, @work.id)
          tags.each do |tag|
            @work.tags.create(name: tag, filename: img.filename)
          end
        end
      redirect_to member_works_path
    else
      render :new
    end
  end

  def index
    @member = Member.find(params[:member_id])
    @works = @member.works
    #byebug
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to member_works_path
    else
      render "edit"
    end
  end

  def destroy
  @work = Work.find(params[:id])
  @work.destroy
  redirect_to member_works_path(current_member)
  end


  private
  def work_params
    params.require(:work).permit(:name, :introduction, :genre_id, {image: []}, :member_id)
  end

  def correct_work
    @work = Work.find(params[:id])
    if @work.member != current_member
      redirect_to root_path
    end
  end


end
