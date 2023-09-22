Rails.application.routes.draw do
  root "lists#index"
  resources :movies do
    resources :bookmarks, only: [:new, :create]
  end

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
end
