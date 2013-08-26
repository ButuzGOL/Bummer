class PagesController < HighVoltage::PagesController
  
  def show
    # REVIEW: make it another way
    if params[:id] == 'home'
      if user_signed_in?
        @record = current_user.records.build
        @records_feed = current_user.records_feed
        
        @discussion = Discussion.new
        @discussions_recent = Discussion.first(5)
        @discussions_popular = Discussion.order('comments_count DESC').first(5)
      end
    end
    super
  end
  
end
