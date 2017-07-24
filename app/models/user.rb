class User < ActiveRecord::Base
  include Docs::User
  include Roles
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :vacancies

  validates :first_name,
            presence: true,
            length: { in: 2..30 },
            format: {
              with: /\A[^(0-9)[[:^alpha:]]]([[:alnum:]'?])*\z/,
              message: 'can not contain spaces or start with numbers'
            }
  validates :last_name,
            presence: true,
            length: { in: 2..30 },
            format: {
              with: /\A[^(0-9)[[:^alpha:]]]([[:alnum:]'?])*\z/,
              message: 'can not contain spaces or start with numbers'
            }

  validates :email,
            presence: true,
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/,
              message: 'email should contain only English letters and numbers'
            }
end
