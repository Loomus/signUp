Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/new_user', to: 'users#new', as: :new_user
  get '/profile', to: 'users#show', as: :profile
  resources :users, only: [:create]
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
