Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions do

  	collection do

  		get 'add_number_options', :action => :add_options
  		get 'create_questions', :action => :create_questions

  	end

  end

  resources :surveys do

  	resources :questions

  end



  root to: 'surveys#index'






end
