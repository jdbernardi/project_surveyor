Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :surveys do

  	resources :questions do

  		collection do
  			post 'add_type', :action => :add_questions

  		end

  	end

  end



  root to: 'surveys#index'






end
