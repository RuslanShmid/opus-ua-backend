class Api::V1::ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0'
      key :title, 'Opus.ua'
      key :description, 'API documentation for Opus.ua project'
      contact do
        key :name, 'LaSoft'
      end
    end
    tag do
      key :name, 'Opus.ua'
      key :description, 'Property operations'
    end

    security_definition :access_token do
      key :type, :apiKey
      key :name, 'access-token'
      key :in, :header
    end

    security_definition :client do
      key :type, :apiKey
      key :name, 'client'
      key :in, :header
    end

    security_definition :uid do
      key :type, :apiKey
      key :name, 'uid'
      key :in, :header
    end

    key :host, Rails.application.config.host
    key :schemes, ['http']
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
      Api::V1::Auth::RegistrationsController,
      Api::V1::Auth::SessionsController,
      Api::V1::VacanciesController,
      Vacancy,
      User,
      self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
