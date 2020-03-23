Rails.application.routes.draw do
  root to: "pages#landing"

  get "/home", to: "pages#home"

  devise_for :users, skip: [:sessions, :registrations, :passwords]
  as :user do
    get 'admin_login', to: 'devise/sessions#new', as: :new_user_session
    post 'admin_login', to: 'devise/sessions#create', as: :user_session
    delete 'admin_logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

end
