class User < ActiveRecord::Base
  include Docs::User
  include Roles
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :user_vacancies, class_name: 'UserVacancy', foreign_key: 'user_id'
end
