Rails.application.routes.draw do

  devise_for :users
  root"home#show"

  resources :posts do
    resources :likes
  end





  get '/admin/sign_in', to: 'super_user/sign_in#new'
  post '/admin/sign_in', to: 'super_user/sign_in#create'


  get '/admin' , to: 'admin/posts#index'







  get '/admin/super_users' , to: 'admin/super_users#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end