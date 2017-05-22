module Docs::Vacancy
  extend ActiveSupport::Concern
  include Swagger::Blocks
  # included do
  #   swagger_schema :AlarmInput do
  #     allOf do
  #       schema do
  #         property :reminder_id do
  #           key :name, 'reminder_id'
  #           key :type, 'integer'
  #           key :description, "Reminder Id"
  #           key :required, true
  #         end
  #
  #         property :time do
  #           key :name, 'title'
  #           key :type, 'string'
  #           key :description, "time format like: '16:25'"
  #           key :required, true
  #         end
  #
  #         property :active do
  #           key :name, 'active'
  #           key :type, 'boolean'
  #           key :description, "'false' by default"
  #           key :required, true
  #         end
  #       end
  #     end
  #   end
  # end
end
