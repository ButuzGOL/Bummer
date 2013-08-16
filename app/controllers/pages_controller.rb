class PagesController < HighVoltage::PagesController
  
  def show
    # REVIEW: make it another way
    if params[:id] == 'home'
      if user_signed_in?
        @record = current_user.records.build
        @records_feed = current_user.records_feed
      end
    end
    super
  end
  
end
