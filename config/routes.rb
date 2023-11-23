Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :manage do
    resources :children, only: [:index, :show, :new, :create] do
      resources :missions, only: [:index, :new, :create] do
        patch :mark_as_finished, to: "missions#mark_as_finished"
      end
      resources :rewards, only: [:new, :create]
    end
  end
  resources :missions, only: [:index, :show, :update] do
    collection do
      get :board
    end
  end

  resources :rewards, only: [:index] do
    resources :claimed_rewards, only: [:create]
  end

end
