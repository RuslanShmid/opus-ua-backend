module Docs::Vacancy
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :VacancyInput do
      key :required, %i(title, category, city, street, active_to_date, job_title, description, price_per_hour)
      allOf do
        schema do
          property :vacancy do
            property :title do
              key :name, 'title'
              key :type, 'string'
              key :description, 'Job Title'
              key :required, true
            end

            property :category do
              key :name, 'category'
              key :type, 'string'
              key :description, 'Category'
              key :required, true
            end

            property :city do
              key :name, 'city'
              key :type, 'string'
              key :description, 'City'
              key :required, true
            end

            property :street do
              key :name, 'street'
              key :type, 'string'
              key :description, 'Street'
            end

            property :active_to_date do
              key :name, 'active_to_date '
              key :type, 'date'
              key :description, 'Active To Date'
            end

            property :job_type do
              key :name, 'job_type'
              key :type, 'string'
              key :description, 'Job Type'
            end

            property :description do
              key :name, 'description'
              key :type, 'string'
              key :description, 'Job Description'
            end

            property :company do
              key :name, 'company'
              key :type, 'string'
              key :description, 'Company'
            end

            property :price_per_hour do
              key :name, 'price_per_hour'
              key :type, 'string'
              key :description, 'Price per hour'
            end
          end
        end
      end
    end

    swagger_schema :VacancyOutput do
      allOf do
        schema do
          property :title do
            key :name, 'title'
            key :type, 'string'
            key :description, 'Job Title'
            key :required, true
          end

          property :category do
            key :name, 'category'
            key :type, 'string'
            key :description, 'Category'
            key :required, true
          end

          property :city do
            key :name, 'city'
            key :type, 'string'
            key :description, 'City'
            key :required, true
          end

          property :street do
            key :name, 'street'
            key :type, 'string'
            key :description, 'Street'
          end

          property :active_to_date do
            key :name, 'active_to_date '
            key :type, 'date'
            key :description, 'Active To Date'
          end

          property :job_type do
            key :name, 'job_type'
            key :type, 'string'
            key :description, 'Job Type'
          end

          property :description do
            key :name, 'description'
            key :type, 'string'
            key :description, 'Job Description'
          end

          property :company do
            key :name, 'company'
            key :type, 'string'
            key :description, 'Company'
          end

          property :price_per_hour do
            key :name, 'price_per_hour'
            key :type, 'string'
            key :description, 'Price per hour'
          end

          property :created_at do
            key :name, 'created_at'
            key :type, :string
            key :description, 'Exact date/time Wearer was created at'
          end

          property :updated_at do
            key :name, 'updated_at'
            key :type, :string
            key :description, 'Exact date/time Wearer was updated at'
          end
        end
      end
    end
  end
end
