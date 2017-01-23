Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  mount Commontator::Engine => '/commontator'

  devise_for :users, class_name: 'FormUser', controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]

  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

  root :to => 'landing#index'

  resources :article

  resources :category

  put '/article/:id/vote_up' =>'article#vote_up', :as => :article_up_vote

  put '/article/:id/vote_down' =>'article#vote_down', :as => :article_down_vote

  post '/subscriber/new' => 'subscriber#create', :as => :new_subscriber

end
