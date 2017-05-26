class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  include Docs::Api::V1::SessionsController

  def create
    super
  end

  def destroy
    super
  end
end
