Rails.application.routes.draw do
	
	resources :projects do
		resources :tasks 
		
	end
	
	resources :tasks do
		resources :comments
	end
	
	
	resources :users 
		

	root 'project#index'
	root 'user#login'
	

end
