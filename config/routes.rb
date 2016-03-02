Rails.application.routes.draw do
  #get 'wikis/index'

  #get 'wikis/show'

  #get 'wikis/new'

  #get 'wikis/edit'

  resources :wikis

  devise_for :users
  get 'welcome/index'

  get 'about' => 'welcome#about'

  root to:'welcome#index'
  
end
