Rails.application.routes.draw do
   
  #get 'users/downgrade'
  
  get 'downgrade' =>'users#downgrade'

  #get 'charges/index'

  #get 'charges/show'

  #get 'charges/new'

  #get 'charges/edit'

  

  resources :charges, only: [:new, :create]

  resources :wikis

  devise_for :users
  get 'welcome/index'

  get 'about' => 'welcome#about'

  root to:'welcome#index'
  
end
