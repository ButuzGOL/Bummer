class SearchController < ApplicationController
  def index
    # TODO: merge them
    @records = Record.search params[:query]
    @discussions = Discussion.search params[:query]
    @users = User.search params[:query]
  end
end
