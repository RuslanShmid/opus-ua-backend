class User < ActiveRecord::Base
  include Roles
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
