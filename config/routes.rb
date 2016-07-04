Rails.application.routes.draw do
  resources :brands, only: :index do
    resources :models, only: :index
  end

  root "brands#index"
end
