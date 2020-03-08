Rails.application.routes.draw do
  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions'
  # }
  root 'users#index'
  get  'help', to:'static_pages#help'
  get  'about', to:'static_pages#about'
  get  'contact', to:'static_pages#contact'
  get  '/', to: 'users#index'
  # resources :playlists,      only: [:create, :destroy]
  resources :playlists
  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'signout', to: 'devise/sessions#destroy'
  end
end
