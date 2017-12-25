Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resource :signs, only: [:create, :destroy]

      resource :profile, only: [:show, :create, :update] do
        resources :session_histories, only: [:index, :show, :create]
        resources :user_pain_causes, except: [:new, :edit]
      end

      resource :password, only: [:edit, :update]

      resources :pain_causes, only: [:index, :show] do
        resources :sessions, only: [:index, :show] do
          resources :quizes, only: [:index, :show]
        end
      end
    end
  end
end
