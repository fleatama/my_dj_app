Rails.application.routes.draw do
  root 'static_pages#home'
  get  'help', to:'static_pages#help'
  get  'about', to:'static_pages#about'
  get  'contact', to:'static_pages#contact'
  get  '/', to: 'users#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  devise_scope :user do
    # get 'user/:id', to: 'users/registrations'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'signout', to: 'devise/sessions#destroy'
  end
  resources :users, :only => [:index, :show]
  resources :movies do
    resource :playlists, only: [:create, :destroy]
  end
  resources :playlists
end
