Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: %i[edit update]
  resources :suggestions, only: %i[edit destroy update] do
    resources :votes, only: %i[create]
  end
  resources :invites, only: %i[edit update destroy]
  resources :events do
    resources :suggestions, only: %i[create]
    resources :invites, only: %i[create]
    resources :messages, only: %i[new create index]
  end

  mount ActionCable.server => "/cable"
end
