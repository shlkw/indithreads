Rails.application.routes.draw do
  get 'carts/show'
  resources :dresses
  root 'home#index'
 
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resource :cart, only: [:show] do
  put 'add/:dress_id', to: 'carts#add', as: :add_to
  put 'remove/:dress_id', to: 'carts#remove', as: :remove_from

end
end 