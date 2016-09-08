Rails.application.routes.draw do
  resources :stories do
    resources :contributions
  end
end
