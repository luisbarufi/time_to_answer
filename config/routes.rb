Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
  end
  
  namespace :users_backoffice do
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  
  devise_for :users
  devise_for :admins, skip: [ :registration ]
  
  root 'site/welcome#index'

end
