Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: %i[edit update]
  resources :suggestions, only: %i[edit update show destroy]
  resources :invites, only: %i[edit update show destroy]
  resources :events do
    resources :suggestions, only: %i[new create index]
    resources :invites, only: %i[new create index]
    resources :messages, only: %i[new create index]
  end
end
