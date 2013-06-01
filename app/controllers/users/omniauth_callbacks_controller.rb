class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # TODO: make this two function into one
  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'], current_user)
    
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      # FIXME: Here have to be flash message 
      session['devise.facebook_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User.find_for_twitter_oauth(request.env['omniauth.auth'], current_user)
    
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'twitter') if is_navigational_format?
    else
      # FIXME: Here have to be flash message 
      session['devise.twitter_data'] = request.env["omniauth.auth"].except('extra')
      redirect_to new_user_registration_url
    end
  end

end