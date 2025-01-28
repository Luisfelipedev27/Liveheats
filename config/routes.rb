Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :races, only: %i[index create show] do
        member do
          post :results
        end
      end
    end
  end
end
