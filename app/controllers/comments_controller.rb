class CommentsController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])
    params[:comment][:user_id] = current_user.id
    @comment = @discussion.comments.create(params[:comment])
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @discussion
    end
  end
end
