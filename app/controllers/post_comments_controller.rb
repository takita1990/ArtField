class PostCommentsController < ApplicationController

  def create
	work = Work.find(params[:work_id])
    comment = PostComment.new(post_comment_params)
	  comment.member_id = current_member.id
    comment.work_id = work.id
    comment.save
    redirect_to work_path(work)
  end

  def destroy
    PostComment.find_by(id: params[:id], work_id: params[:work_id]).destroy
    redirect_to work_path(params[:work_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
