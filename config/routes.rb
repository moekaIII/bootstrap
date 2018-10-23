Rails.application.routes.draw do

  get 'sessions/new'

  resources :blogs do
    collection do
      post :confirm
    end
    collection do
      get :list
    end
  end

  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
