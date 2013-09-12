class UsersController < ApplicationController
  before_filter :discussions

  def show
    @user = User.find(params[:id])
    @records = @user.records
    @discussions = @user.discussions
    
    if @user == current_user
      @record = current_user.records.build
    end
  end

  def following
    # TODO: Add titles
    @user = User.find(params[:id])
    @users = @user.followed_users    
  end

  private

    def discussions
      @discussions_recent = Discussion.first(5)
      @discussions_popular = Discussion.order('comments_count DESC').first(5)
    end
end
