class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Docs::Api::V1::RegistrationsController

  def create
    super do
      # @resource&.master!
    end
  end

  def destroy
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
