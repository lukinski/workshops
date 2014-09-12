Rails.application.routes.draw do
  get '/profile/:id' => 'profiles#show', as: :profile

  devise_for :users
  
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
end
