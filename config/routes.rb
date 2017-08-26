Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users, only: [:index, :show]
  resources :notes
  # You can have the root of your site routed with "root"
  # root 'notes#index'
  root 'pages#home'

end
