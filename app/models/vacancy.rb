class Vacancy < ApplicationRecord
  include Docs::Vacancy

  has_many :user_vacancies, class_name: 'UserVacancy', foreign_key: 'vacancy_id'

  validates :title,
            presence: true,
            length: { in: 2..30 },
            format: { with: /\A^([^0-9]*)$\z/ }
end
