class PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      render json: { success: true, data: { redirect_url: after_sending_reset_password_instructions_path_for(resource_name) } }
    else
      render json: { success: false, errors: ['Wrong username/email.'] }
    end
  end

end