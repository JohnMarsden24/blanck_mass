Rails.application.routes.draw do

  root to: "pages#landing"

  get "/home", to: "pages#home"
  get "/shows", to: "pages#shows"
  get "/videos", to: "pages#videos"
  get "/admin", to: "admin#home"

  resources :posts, :shows, :videos, only: [:create, :update, :destroy]

  devise_for :users, skip: [:sessions, :registrations, :passwords]

  as :user do
    get 'admin_login', to: 'devise/sessions#new'
    post 'admin_login', to: 'devise/sessions#create', as: :user_session
    delete 'admin_logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

end
