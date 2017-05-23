Rails.application.routes.draw do
  devise_for :admin, class_name: 'User'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :vacancies
    end
  end
end
