Rails.application.routes.draw do
  root "articles#index"
  # The comments as a nested resource within articles
  resources :articles do
    resources :comments
  end
  resources :authors
end
