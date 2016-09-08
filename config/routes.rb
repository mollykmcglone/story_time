Rails.application.routes.draw do
  resources :stories do
    resources :contributions
  end

  resources :contributions do
    resources :images
  end
end
