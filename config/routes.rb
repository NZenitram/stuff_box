Rails.application.routes.draw do
  root "dashboard#index"

  get "/login",                           to: "sessions#new"
  post "/login",                          to: "sessions#login"
  post "/create_account",                 to: "sessions#create"
  get "/logout",					                to: "sessions#destroy"
  get "/verify_phone",                    to: "sessions#verify_phone"
  post "/verify_phone",                   to: "sessions#verify_user"
  get "/update_password",                 to: "users#update"
  post "/update_password",                to: "users#update_password"
  get "/update_password_verify_phone",    to: "users#verify_phone"
  post "/update_password_verify_phone",   to: "users#verify_user"

  get "/dashboard/:folder", to: "folders#index", as: "current_folder"
  get "/up", to: "folders#up"
  get "/root_folder", to: "folders#root"
  get "/new_folder", to: "folders#new"
  post "/create_folder", to: "folders#create"

end
