module Docs::Api::V1
  module SessionsController
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/auth/sign_in' do
        operation :post do
          key :description, 'Signs in existing User'
          key :operationId, 'signInUser'
          key :tags, ['session']

          parameter do
            key :name, :session
            key :in, :body
            key :description, 'Object with nested params'
            key :required, true
            key :type, :object
            schema do
              key :'$ref', :SessionInput
            end
          end

          response 200 do
            key :description, 'Success'
          end

          response 401 do
            key :description, 'Invalid login credentials. Please try again.'
          end
        end
      end

      swagger_path '/auth/sign_out' do
        operation :delete do
          key :description, 'Signs out User'
          key :operationId, 'signOutUser'
          key :tags, ['session']

          security do
            key :access_token, []
            key :client, []
            key :uid, []
          end

          response 200 do
            key :description, 'Success'
          end

          response 404 do
            key :description, 'User was not found.'
          end
        end
      end
    end
  end
end