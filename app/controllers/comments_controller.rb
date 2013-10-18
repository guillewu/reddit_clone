class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    # @comment.parent_comment_id = params[:parent_comment_id]

    @link = Link.find(params[:link_id])
    @parent_comment = Comment.find(params[:parent_comment_id])

    render :new
  end

  def create
    link = Link.find(params[:link_id])
    @comment = link.comments.build(params[:comment])

    @comment.user_id = current_user.id

    if @comment.save
      redirect_to link
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end
end
