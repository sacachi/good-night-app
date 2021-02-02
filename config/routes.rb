Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index] do
        member do
          get :following_users
          get :followed_users
          get :sleep_trackers
          post :follow
          post :unfollow
          post :track_sleep
        end
      end
    end
  end
end
