Rails.application.routes.draw do
  post   '/event_attendees', to: 'event_attendees#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  resources :users, only: [:create, :show]
  resources :events
  root 'events#index'

end
