Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
