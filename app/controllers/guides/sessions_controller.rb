# frozen_string_literal: true

class Guides::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :logout_status, only:[:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_out_path_for(resource)
    new_guide_session_path
  end
  def after_sign_in_path_for(resource)
    guide = current_guide
    guides_top_path
  end
  def logout_status
    @guide = Guide.find_by(email: params[:guide][:email], status: "退会")
    if @guide
      flash[:notice] = "退会済みのアカウントです"
      redirect_to new_guide_session_path
    end
  end
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
