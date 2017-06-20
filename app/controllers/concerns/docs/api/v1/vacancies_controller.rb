module Docs::Api::V1
  module VacanciesController
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/vacancies' do
        operation :get do
          key :description, 'Returns all vacancies'
          key :operationId, 'allVacancies'
          key :produces, ['application/json']
          key :tags, ['vacancy']

          parameter do
            key :in, :query
            key :name, :title
            key :description, 'search by title'
            key :required, false
            key :type, :string
            key :format, :string
          end

          parameter do
            key :in, :query
            key :name, :category
            key :description, 'search by category'
            key :required, false
            key :type, :string
            key :format, :string
          end

          parameter do
            key :in, :query
            key :name, :city
            key :description, 'search by city'
            key :required, false
            key :type, :string
            key :format, :string
          end

          response 200 do
            key :description, 'Success'
          end
        end

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

      swagger_path '/vacancies/{id}' do
        operation :put do
          key :description, 'Updates a certain Vacancy'
          key :operationId, 'findVacancyById'
          key :tags, ['vacancy']

          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of vacancy'
            key :required, true
            key :type, :integer
            key :format, :int
          end

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

          response 200 do
            key :description, 'Success'
            schema do
              key :'$ref', :VacancyOutput
            end
          end

          response 404 do
            key :description, 'Vacancy not found'
          end
        end

        operation :get do
          key :description, 'Returns a certain Vacancy'
          key :operationId, 'findVacancyById'
          key :tags, ['vacancy']
          
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of vacancy'
            key :required, true
            key :type, :integer
            key :format, :int
          end

          response 200 do
            key :description, 'Success'
            schema do
              key :'$ref', :VacancyOutput
            end
          end

          response 404 do
            key :description, 'Vacancy not found'
          end
        end

        operation :delete do
          key :description, 'Destroys a Vacancy'
          key :operationId, 'deleteVacancyById'
          key :tags, ['vacancy']

          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of vacancy'
            key :required, true
            key :type, :integer
            key :format, :int
          end

          response 200 do
            key :description, 'Success'
          end

          response 404 do
            key :description, 'Vacancy not found'
          end
        end
      end
    end
  end
end
