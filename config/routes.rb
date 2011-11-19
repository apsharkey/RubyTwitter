TwitterEnvy::Application.routes.draw do
  
  devise_for :users
  
  resources :users, :only => [:show, :index, :update] do
    member do
      get :following, :followers, :profile_feed
    end
  end
  
  resources :posts, :only => [:create, :destroy]
  resources :reposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :searches, :only => [:index]
  
  root :to => "pages#home"
  
  match '/shared/feed', :to => "pages#feeder", :as => "feed"
  match '/auth/:provider/callback' => 'authentications#create'

  
  # SETTINGS FILTER
  match '/pages/password_settings', :to => "users#password_settings", :as => "password_settings"
  match '/pages/profile_settings', :to => "users#profile_settings", :as => "profile_settings"
  match '/pages/photo_settings', :to => "users#photo_settings", :as => "photo_settings"
  
  # FEED FILTER
  match '/pages/timeline_feed', :to => "users#timeline_feed", :as => "timeline_feed"
  match '/pages/mentions_feed', :to => "users#mentions_feed", :as => "mentions_feed"
  match '/pages/reposts_feed', :to => "users#reposts_feed", :as => "reposts_feed"

  # PROFILE FILTER
  match '/pages/following_feed', :to => "users#following_feed", :as => "following_feed"  
  match '/pages/followers_feed', :to => "users#followers_feed", :as => "followers_feed"  

  match '/contact',       :to => 'pages#contact'
  match '/featured',      :to => "users#featured"
  match '/search/:query', :to => "searches#index"
  match '/search',        :to => "searches#index"
  
  match '/people',  :to => "searches#people"

  match '/update', :to => "users#update_photo"

  match '/about', :to => "pages#about"
end
