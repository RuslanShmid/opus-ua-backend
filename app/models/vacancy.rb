class Vacancy < ApplicationRecord
  include Docs::Vacancy
  belongs_to :user
  has_many :users_vacancies

  validates :title,
            presence: true,
            length: { in: 2..30 }

  validates :email,
            presence: true,
            format: { with: /\A^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$\z/ }

  validates :price_per_hour,
            presence: true,
            format: { with: /\A^[0-9]*\.?[0-9]+$\z/ }

  validates :description,
            presence: true

  validates :active_to_date,
            presence: true

  validates :company,
            presence: true
end
