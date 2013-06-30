class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    
    render json: { success: true, data: { redirect_url: after_sign_in_path_for(resource) } }
  end

  def failure
    render json: { success: false, errors: ['Wrong username/email and password combination.'] }
  end
end