Rails.application.routes.draw do
  root :to => 'images#index'

  resources :stories do
    resources :contributions
  end

  resources :images, :only => [:show, :index]
end
