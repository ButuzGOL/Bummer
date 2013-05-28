class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    sign_in(resource_name, resource)
    set_flash_message(:notice, :signed_in)
    return render json: { success: true, data: { redirect_url: root_path } }
  end

  def failure
    return render json: { success: false, errors: ['Wrong Username/email and password combination.'] }
  end
end