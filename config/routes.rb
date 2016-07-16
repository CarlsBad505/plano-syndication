Rails.application.routes.draw do
  root to: 'landing#index'
  get 'syndications/:name', to: 'syndications#show'
end
