module Docs::Api::V1
  module VacancyController
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      # swagger_path '/master/auth' do
      #   operation :post do
      #     key :description, 'Registers a new User'
      #     key :operationId, 'registerUser'
      #     key :tags, [
      #         'registration'
      #     ]
      #
      #     parameter do
      #       key :name, :registration
      #       key :in, :body
      #       key :description, 'Object with nested params'
      #       key :required, true
      #       key :type, :object
      #       schema do
      #         key :'$ref', :UserInput
      #       end
      #     end
      #
      #     response 200 do
      #       key :description, 'Success'
      #       schema do
      #         key :'$ref', :UserOutput
      #       end
      #     end
      #   end
      # end
    end
  end
end
