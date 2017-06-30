class UsersVacancySerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :vacancy_id,
             :full_name,
             :email
end
