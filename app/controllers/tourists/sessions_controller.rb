# frozen_string_literal: true

class Tourists::SessionsController < Devise::SessionsController
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
    new_tourist_session_path
  end
  def after_sign_in_path_for(resource)
    tourist = current_tourist
    tourists_top_path
  end
  def logout_status
    @tourist = Tourist.find_by(email: params[:tourist][:email], status: "退会")
    if @tourist
      flash[:notice] = "退会済みのアカウントです"
      redirect_to new_tourist_session_path
    end
  end
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
