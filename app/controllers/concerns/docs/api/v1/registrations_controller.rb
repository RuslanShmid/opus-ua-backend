module Docs::Api::V1
  module RegistrationsController
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/auth/sign_up' do
        operation :post do
          key :description, 'Registers a new User'
          key :operationId, 'registerUser'
          key :tags, [
              'registration'
          ]

          parameter do
            key :name, :registration
            key :in, :body
            key :description, 'Object with nested params'
            key :required, true
            key :type, :object
            schema do
              key :'$ref', :UserInput
            end
          end

          response 200 do
            key :description, 'Success'
            schema do
              key :'$ref', :UserOutput
            end
          end

          response 422 do
            key :description, 'Unprocessable Entity'
            schema do
              key :'$ref', :UserInvalidParams
            end
          end
        end
      end
    end
  end
end
