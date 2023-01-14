Rails.application.routes.draw do

  get 'items_imports/new'
  get 'items_imports/create'
  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  # devise_scope :user do
  #   post 'users/sign_up', to: 'devise/registrations#create'
  #  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # resources :posts do
  #   resources :likes
  # end

  get '/admin/users', to: 'users/users#index'



  get '/admin/sign_in', to: 'super_user/sign_in#new'
  post '/admin/sign_in', to: 'super_user/sign_in#create'


  get '/admin' , to: 'admin/posts#index'


  get '/admin/create_super_user', to: 'super_user/super_user#new'
  post '/admin/create_super_user', to: 'super_user/super_user#create'
  delete '/admin/super_user', to: 'super_user/super_user#destroy'






  get '/admin/super_users' , to: 'admin/super_users#index'
  get '/admin/super_users/edit' , to: 'admin/super_users#edit'
  put '/admin/super_users/update' , to: 'admin/super_users#update'


  get '/admin/new_role' , to: 'roles/roles#new'
  post '/admin/create_role' , to: 'roles/roles#create'
  get '/admin/create_role/set_cities' , to: 'roles/roles#set_cities'
  get '/admin/create_role/set_offices' , to: 'roles/roles#set_offices'
  get '/admin/roles/edit' , to: 'roles/roles#edit'
  get '/admin/roles' , to: 'roles/roles#index'
  put '/admin/roles' , to: 'roles/roles#update'


  get '/admin/users_report' , to: 'users_report#index'
  get '/admin/user_report' , to: 'users_report#show'
  get '/admin/monthly_report' , to: 'users_report#monthly_report'


  # scope '/admin' do
  #   resources :attendance do
  #     collection do
  #       post :import
  #     end
  #   end
  # end
  get '/admin/attendance' , to: 'attendance#index'
  post '/admin/attendance/load_data' , to: 'attendance#create'

  get '/admin/attendance/export' , to: 'attendance#export'
  get '/admin/attendance/import' , to: 'attendance#import'

  get '/admin/attendance/export_csv' , to: 'attendance#export_csv'

  resources :items_imports ,only: [:index, :new, :create] , path: '/admin/items'

  # resources :user_profile ,only: [:show,:create,:new] , path: '/user_profile'

  get '/user_profile/new' , to: 'user_profile#new'
  get '/user_profile/show' , to: 'user_profile#show'
  post '/user_profile/create' , to: 'user_profile#create'

  get '/user_profile_admin/cites' , to: 'user_profile#cites'

  get '/user_attendance/attendances' , to: 'user_attendance#show'




  get 'user/leaves' , to: 'leave#index'
  get 'user/leave_application' , to: 'leave_requests#new'
  post 'user/leave_application' , to: 'leave_requests#create'
  # put 'user/leave_application'   , to:"line_manager_approval#approve"
  get 'user/recevied_leave_application'   , to:"line_manager_approval#index"
  put 'user/recevied_leave_application'   , to:"line_manager_approval#approve"
  put 'user/reject_recevied_leave_application'   , to:"line_manager_approval#reject"




  get 'admin/leave_applications' , to:"approve#index"
  patch 'admin/leave_applications/approve' , to:"approve#approve"
  patch 'admin/leave_applications/reject' , to:"approve#reject"



  get 'admin/user_workflow' , to:"user_workflows#new"
  post 'admin/user_workflow' , to:"user_workflows#create"
  get 'admin/edit_user_workflow' , to:"user_workflows#edit"
  put 'admin/edit_user_workflow' , to:"user_workflows#update"



  get "admin/country", to:"countries#new"
  post "admin/country", to:"countries#create"



  get 'admin/cities', to:"cities#new"
  post "admin/cities", to:"cities#create"



  get 'admin/office', to:"offices#new"
  post 'admin/office', to:"offices#create"

  get 'admin/category/new', to:"categories#new"
  post 'admin/category/create', to:"categories#create"
  delete 'admin/category/destroy', to:"categories#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
