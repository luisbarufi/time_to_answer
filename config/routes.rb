Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
  end
  
  namespace :admins_backoffice do
    get 'welcome/index'
  end

  devise_for :admins
  
  root 'site/welcome#index'
  
end
