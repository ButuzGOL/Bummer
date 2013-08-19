class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @records = @user.records
    @discussions = @user.discussions

    if @user == current_user
      @record = current_user.records.build
    end
  end
end
