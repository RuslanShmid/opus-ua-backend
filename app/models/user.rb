class User < ActiveRecord::Base
  include Docs::User
  include Roles
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :vacancies
end
