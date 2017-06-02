Rails.application.routes.draw do
  devise_for :admin, class_name: 'User'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',
                                  controllers:
                                      { sessions: 'api/v1/auth/sessions',
                                        registrations: 'api/v1/auth/registrations' }
      devise_scope :user do
        post '/auth/sign_up' => 'api/v1/auth/registrations#create'
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :vacancies do
        resources :user_vacancies
      end
      resources :apidocs, only: [:index]
    end
  end

  get '/api' => redirect('/api/swagger-ui/dist/index.html?url=/api/v1/apidocs')
end
