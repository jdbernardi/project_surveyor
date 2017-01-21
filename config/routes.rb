Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'define_options', to: 'question_types#set_mc_options'

  resources :surveys,   only: [:index, :new, :create, :destroy] do

  	resources :questions

	end


  resources :question_types,  only: [:index]
  get 'select_question_type', to: "question_types#select"
  get 'select_mc_options', to: 'question_types#options'

  resources :multiple_choice_questions, only: [:new, :create, :update]

  root to: "surveys#index"

  post '/surveys/:id/questions/add_type', to: 'question_types#select'




end
