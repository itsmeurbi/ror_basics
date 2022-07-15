Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'posts#index'
end
