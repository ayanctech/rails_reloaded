Rails.application.routes.draw do
  root "subscribers#index"

  resources :subscribers do
    get "download_pdf", on: :collection
    get "download_csv", on: :collection
    get "send_mail", on: :collection 
  end
  resources :posts
  resources :users
end
