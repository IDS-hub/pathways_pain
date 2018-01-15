Rails.application.routes.draw do
  namespace :admin do
    resources :users

    resources :pain_causes
    resources :sessions
    resources :session_histories

    resources :quizzes

    root to: "users#index"
  end

  # no names or namespaces starting with 'admin_'!
  # administrate gem become to parse them
  resources :sign_in_admin, only: [:new, :create] do
    delete :delete_session, on: :collection
  end

  namespace :api do
    namespace :v1 do
      resource :signs, only: [:create, :destroy]

      resource :profile, only: [:show, :create, :update] do
        resource :auth_providers, only: [:create, :show]

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


