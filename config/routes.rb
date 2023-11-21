Rails.application.routes.draw do
  get 'claimed_rewards/create'
  get 'rewards/index'
  get 'rewards/new'
  get 'rewards/create'
  get 'missions/new'
  get 'missions/create'
  get 'missions/show'
  get 'missions/update'
  get 'missions/board'
  get 'children/index'
  get 'children/new'
  get 'children/create'
  get 'children/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :manage do
    get 'rewards/new'
    get 'rewards/create'
    get 'missions/new'
    get 'missions/create'
    get 'children/new'
    get 'children/create'
    get 'children/show'
    get 'children/index'
    resources :children, only: [:index, :show, :new, :create] do
      resources :missions, only: [:new, :create]
      resources :rewards, only: [:new, :create]
    end
  end
  resources :missions, only: [:show, :update] do
    collection do
      get :board
    end
  end

  resources :rewards, only: [:index] do
    resources :claimed_rewards, only: [:create]
  end

end
