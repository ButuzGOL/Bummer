class DiscussionsController < ApplicationController

  def show
    @discussion = Discussion.find(params[:id])
    # FIXME: optimize this two line
    @discussions_recent = Discussion.first(5)
    @discussions_popular = Discussion.order('comments_count DESC').first(5)
  end

  def create
    record = Record.find(params[:discussion][:record_id])
    @discussion = record.discussions.build(params[:discussion])
    if @discussion.save
      flash[:success] = 'Discussion created!'
      redirect_to @discussion
    end
  end

end
