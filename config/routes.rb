Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resource :signs, only: [:create, :destroy]
      resource :profile, only: [:show, :create, :update]
      resource :password, only: [:edit, :update]
    end
  end
end
