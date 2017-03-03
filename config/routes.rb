Rails.application.routes.draw do
  root 'projects#index'

  resources :articles
  resources :projects
end
