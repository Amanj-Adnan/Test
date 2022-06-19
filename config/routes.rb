Rails.application.routes.draw do

  get 'items_imports/new'
  get 'items_imports/create'
  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :posts do
    resources :likes
  end

  get '/admin/users', to: 'users/users#index'



  get '/admin/sign_in', to: 'super_user/sign_in#new'
  post '/admin/sign_in', to: 'super_user/sign_in#create'


  get '/admin' , to: 'admin/posts#index'


  get '/admin/create_super_user', to: 'super_user/super_user#new'
  delete '/admin/super_user', to: 'super_user/super_user#destroy'






  get '/admin/super_users' , to: 'admin/super_users#index'


  get '/admin/new_role' , to: 'roles/roles#new'

  # scope '/admin' do
  #   resources :attendance do
  #     collection do
  #       post :import
  #     end
  #   end
  # end
  get '/admin/attendance' , to: 'attendance#index'

  get '/admin/attendance/export' , to: 'attendance#export'
  get '/admin/attendance/import' , to: 'attendance#import'

  resources :items_imports ,only: [:index, :new, :create] , path: '/admin/items'

  resources :user_profile ,only: [:show,:create,:new] , path: '/user_profile'
  get '/user_attendance/attendances' , to: 'user_attendance#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
