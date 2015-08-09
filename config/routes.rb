Rails.application.routes.draw do
  resources :logs
  root to: "logs#index"
end
