class Vacancy < ApplicationRecord
  validates :title,
            presence: true,
            length: { in: 2..30 },
            format: { with: /\A^([^0-9]*)$\z/ }
end
