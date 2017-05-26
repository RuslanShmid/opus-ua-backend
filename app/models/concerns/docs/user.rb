module Docs::User
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :UserInput do
      allOf do
        schema do
          property :user do
            property :first_name do
              key :name, 'first_name'
              key :type, 'string'
              key :description, 'First Name'
              key :required, true
            end

            property :last_name do
              key :name, 'last_name'
              key :type, 'string'
              key :description, 'Age'
              key :required, true
            end

            property :email do
              key :name, 'email'
              key :type, 'string'
              key :description, 'Email'
              key :required, true
            end

            property :password do
              key :name, 'password'
              key :type, 'string'
              key :description, 'Password (minimum 8 characters)'
              key :required, true
            end

            property :password_confirmation do
              key :name, 'password_confirmation'
              key :type, 'string'
              key :description, 'Password Confirmation'
              key :required, true
            end
          end
        end
      end
    end

    swagger_schema :UserOutput do
      allOf do
        schema do
          property :id do
            key :name, 'id'
            key :type, 'integer'
            key :description, 'User Id'
          end

          property :first_name do
            key :name, 'first_name'
            key :type, 'string'
            key :description, 'First Name'
          end

          property :last_name do
            key :name, 'last_name'
            key :type, 'string'
            key :description, 'last_name'
          end

          property :email do
            key :name, 'email'
            key :type, 'string'
            key :description, 'email'
          end

          property :role do
            key :name, 'role'
            key :type, 'string'
            key :description, 'User role'
          end
        end
      end
    end

    swagger_schema :UserInvalidParams do
      allOf do
        schema do
          property :errors do
            key :name, 'errors'
            key :type, 'string'
            key :description, 'Response status'
          end
        end
      end
    end

    swagger_schema :SessionInput do
      key :required, [:email, :password]
      property :email do
        key :name, :email
        key :required, true
        key :type, :string
      end
      property :password do
        key :name, :password
        key :required, true
        key :type, :string
      end
    end
  end
end
