Rails.application.routes.draw do
   
  #get 'users/downgrade'
  
  get 'downgrade' =>'users#downgrade'


  resources :charges, only: [:new, :create]

  resources :wikis

  devise_for :users
  get 'welcome/index'

  get 'about' => 'welcome#about'

  root to:'welcome#index'
  
end
