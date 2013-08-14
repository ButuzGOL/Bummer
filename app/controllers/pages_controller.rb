class PagesController < HighVoltage::PagesController
  
  def show
    # REVIEW: make it another way
    if params[:id] == 'home'
      if user_signed_in?
        @micropost = current_user.microposts.build
        @microposts_feed = current_user.microposts_feed
      end
    end
    super
  end
  
end
