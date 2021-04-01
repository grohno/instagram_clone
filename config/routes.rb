Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
