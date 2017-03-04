Rails.application.routes.draw do
  root 'projects#index'

  resources :articles
  resources :projects

  get "/pages/*id" => "pages#show", as: :page, format: false
  get "/resume" => "pages#show#", id: "resume"
end
