Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :vacancies
    end
  end

  get '/api' => redirect('/api/swagger-ui/dist/index.html?url=/api/v1/apidocs')
end
