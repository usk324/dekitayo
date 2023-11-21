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
end
