Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  resources :books do
    resources :book_copies, only: [:index, :new, :create]
  end
  resources :book_copies, only: [:show, :destroy]
  resources :borrowers do 
    resources :borrowing_records, only: [:index, :update, :new] do
      post "borrow" => "borrowing_records#borrow", on: :collection
      put "return_book" => "borrowing_records#return_book", on: :collection
    end
  end
  resources :borrowing_records, only: [:index]
  root "books#index"
end
