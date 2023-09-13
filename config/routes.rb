Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations',passwords: 'users/passwords'}
 
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new'
    post 'users/sign_in', to: 'users/sessions#create'
    get 'users/sign_out', to: 'users/sessions#destroy'
    get 'users/sign_up', to: 'users/registrations#new'
    post 'users/sign_up', to: 'users/registrations#create'
    authenticated :user do
      root to: 'home#dashboard'
    end
    unauthenticated do
      root to: "users/sessions#new", as: nil
    end
  end

  get "admin_dash", to: "home#admin_dash"
  get "all_user", to: "home#all_user"
  get "user_details", to: "home#user_details"
  post "user_verify", to: "home#user_verify"
  post "user_delete", to: "home#user_delete"
  post "user_update", to: "home#user_update"
  get "undefined", to: "home#undefined"
  
  get "mass_data_upload", to: "home#mass_data_upload"  
  post "save_mass_data_upload", to: "home#save_mass_data_upload" 
end
