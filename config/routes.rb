Rails.application.routes.draw do
  get '/contacts', to: 'contacts#new'
  get '/blogs', to: 'blogs#index'

  resources :blogs do
    collection do
      post :confirm
    end
    collection do
      get :list
    end
  end


 resources :contacts
end
