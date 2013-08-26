class DiscussionsController < ApplicationController

  def show
    @discussion = Discussion.find(params[:id])
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
