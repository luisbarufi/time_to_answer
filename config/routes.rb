Rails.application.routes.draw do

  namespace :site do
    get  'welcome/index'
    get  'search', to: 'search#questions'
    get  'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update' 
  end

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  
  devise_for :users
  devise_for :admins, skip: [ :registration ]

  get 'commando', to: 'admins_backoffice/welcome#index'
  
  root 'site/welcome#index'

end
