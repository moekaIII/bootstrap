Rails.application.routes.draw do
  get '/contacts', to: 'contacts#new'
  get '/blogs', to: 'blogs#index'
  get '/stocks', to: 'stocks#index'
  
  root 'static_pages/index'
  
  resources :blogs do
    collection do
      post :confirm
    end
  end
  

 resources :contacts
end