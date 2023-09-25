# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end
  def update
    # This action handles the form submission and changes the password
    if current_user.update_with_password(password_params)
      bypass_sign_in(current_user)
      redirect_to root_path, notice: 'Your password has been changed successfully.'
    else
      render :edit
    end
  end
  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
