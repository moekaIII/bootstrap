Rails.application.routes.draw do

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
