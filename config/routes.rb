Rails.application.routes.draw do
  get 'tourists/top'
  get 'guides/top' #変更あるかも
  get 'homes/about'
  
	devise_for :admins, controllers: {
		sessions:      "admins/sessions",
		passwords:     "admins/passwords",
		registrations: "admins/registrations" 
	}
	get "admins/top"

	devise_for :tourists, controllers: {
		sessions:      "tourists/sessions",
		passwords:     "tourists/passwords",
		registrations: "tourists/registrations" 
	}

	devise_for :guides, controllers: {
		sessions:      "guides/sessions",
		passwords:     "guides/passwords",
		registrations: "guides/registrations" 
	}
	root to: 'homes#top'
	get "tourists/:id/delete_me" => "tourists#delete_me", as: "tourist_delete_me"
	put "tourists/:id/delete_me" => "tourists#withdraw", as: "tourist_withdraw"

	get "guides/:id/delete_me" => "guides#delete_me", as: "guide_delete_me"
	put "guides/:id/delete_me" => "guides#withdraw", as: "guide_withdraw"

	resources :tourists, only: [:show, :edit, :update]
	resources :guides, only: [:show, :edit, :update]
	
	namespace :admin do
		resources :tourists, only: [:index, :show, :edit, :update]
		resources :guides, only: [:index, :show, :edit, :update]
		resources :schedules, only: [:show]
	end
	namespace :tourist do
		resources :guides, only: [:index, :show]
		resources :schedules, only: [:index, :show] do
			resource :tourist_comments, only: [:create]
		end
		resource :tourist_comments, only: [:destroy]
	end
	namespace :guide do
		resources :guides, only: [:index, :show, :create]
		resources :schedules, only: [:index, :show, :create, :update]
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
