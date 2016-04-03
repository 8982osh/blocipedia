Rails.application.routes.draw do
   
  
  get 'downgrade' =>'users#downgrade'


  resources :charges, only: [:new, :create]

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  devise_for :users
  
  get 'welcome/index'

  get 'about' => 'welcome#about'

  root to:'welcome#index'
  
end
