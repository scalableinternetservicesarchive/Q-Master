Rails.application.routes.draw do
  resources :questions
#  get 'welcome/index'
  resources :sessions, only: [:new, :create, :destory]
  resources :users
#  resources :articles
#  resources :comments
  resources :articles do
    resources :comments
  end

  root  'static_pages#home'
  match '/signup', to: 'users#new', via:'get'
  match '/signin', to: 'sessions#new', via:'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/help', to: 'static_pages#help', via:'get'
  match '/about', to: 'static_pages#about', via:'get'
  match '/contact', to: 'static_pages#contact', via:'get'
#root 'welcome#index'
end
