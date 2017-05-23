class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    render json: {}, status: 200
  end

  protected

  def configure_permitted_parameters
    @registration_params = [:role, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: @registration_params)
  end
end
