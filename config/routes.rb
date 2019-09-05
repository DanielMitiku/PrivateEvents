Rails.application.routes.draw do
  get 'events/new'
  get 'events/index'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  get 'events/show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  resources :users, only: [:create, :show]

end
