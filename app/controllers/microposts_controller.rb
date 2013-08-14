class MicropostsController < ApplicationController
  before_filter :authenticate_user!

  def create
    
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_path
    end

  end

end
