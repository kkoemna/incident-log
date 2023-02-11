Rails.application.routes.draw do
  devise_for :users
  root to: 'incidents#index'
  resources :incidents do
    resources :responses
  end
end