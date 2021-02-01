Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        member do
          get :sleep_trackers
        end
      end
    end
  end
end
