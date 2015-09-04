Rails.application.routes.draw do

  devise_for :employees, :controllers => { registrations: 'registrations' }, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}

  root 'home#index'
  get 'home/index'
  get 'admin/index'
  get 'account_information/index'
  get 'search/index'
  get 'search/result'

  resources :employees do
    collection do
      get 'active'
      get 'inactive'
      get 'administrators'
    end
    member do
      get :delete
    end
  end

  resources :tracking_forms, only: [:show, :new, :create, :edit, :update, :destroy]  do
    member do
      get 'delete'
      get 'for_forwarding'
      patch 'forwarding'  
      put 'forwarding'
      get 'add_remark'
      post 'adding_remark' 
      get 'for_return'
      patch 'returning'  
      put 'returning' 
      patch 'receive'  
      put 'receive' 
    end
    collection do
      get 'forwarded_forms'
      get 'pending_forms'
      get 'approved_forms'
      get 'pending'
      get 'pendings_for_dept'
    end
  end

  resources :departments,  only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      get :delete
    end
  end
  
end
