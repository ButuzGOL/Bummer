class RecordsController < ApplicationController
  before_filter :authenticate_user!

  def create
    
    @record = current_user.records.build(params[:record])
    if @record.save
      flash[:success] = 'Record created!'
      redirect_to root_path
    end

  end

end
