module Docs::Api::V1
  module UserVacanciesController
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/users_vacancies' do
        operation :post do
          key :description, 'Creates new Vacancy'
          key :operationId, 'addVacancy'
          key :produces, ['application/json']
          key :tags, ['vacancy']

          parameter do
            key :name, :vacancy
            key :in, :body
            key :description, 'Object with nested params'
            key :required, true
            key :type, :object
            schema do
              key :'$ref', :VacancyInput
            end
          end

          response 201 do
            key :description, 'Creates a new Vacancy'
          end
        end
      end
    end
  end
end
