Rails.application.routes.draw do

  root "users#index"
  get "sign_up" => "users#sign_up", :as => "sign_up"
  get "sign_in" => "users#sign_in", :as => "sign_in"
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as=> "logout"

  resources :users do
    collection do
      get 'sign_up'
    end
  end
end
