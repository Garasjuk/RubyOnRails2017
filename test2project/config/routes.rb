Rails.application.routes.draw do
	
  
  get 'sessions/new'

	resources :projects do
		resources :tasks 
		
	end
	
	resources :tasks do
		resources :comments
	end
	
	
	resources :users 
	resources :reports 
		

	root 'project#index'
	root 'user#login'
	root 'home#index'

	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	get "sign_up" => "users#new", :as => "sign_up"
	get "account/:id" => "users#edit", :as => "account"
	root :to => "users#new"
	resources :sessions
	
end
