class Vacancy < ApplicationRecord
  include Docs::Vacancy

  validates :title,
            presence: true,
            length: { in: 2..30 },
            format: { with: /\A^([^0-9]*)$\z/ }
end
