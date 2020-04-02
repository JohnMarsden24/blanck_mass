Rails.application.routes.draw do

  root to: "pages#landing"

  get "/home", to: "pages#home"
  get "/admin", to: "admin#home"
  get "/audio", to: "audios#index", as: 'audios_index'
  get "/contact", to: "contacts#index", as: 'contacts_index'

  resources :shows, :videos, only: [:index, :create, :update, :destroy]
  resources :posts, :audios, :contacts, only: [:create, :update, :destroy ]

  devise_for :users, skip: [:sessions, :registrations, :passwords]

  as :user do
    get 'admin_login', to: 'devise/sessions#new'
    post 'admin_login', to: 'devise/sessions#create', as: :user_session
    delete 'admin_logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

end
