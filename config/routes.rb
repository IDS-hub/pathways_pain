Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resource :signs, only: [:create, :destroy]

      resource :profile, only: [:show, :create, :update] do
        # todo: add session_lists?
        resources :session_histories, only: [:index, :show]
        resources :user_pain_causes
      end

      resource :password, only: [:edit, :update]

      resources :pain_causes, only: [:index, :show] do
        resources :session_lists, only: [:index, :show] do
          resources :sessions, only: [:index, :show]
        end
      end

    end
  end

end
