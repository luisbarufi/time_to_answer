Rails.application.routes.draw do

  namespace :site do
    get  'welcome/index'
    get  'search', to: 'search#questions' # saindo um pouco do REST
    post 'answer', to: 'answer#question'
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
