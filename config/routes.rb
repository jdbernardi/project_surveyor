Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :surveys,   only: [:index, :new, :create, :destroy]

  resources :questions
  resources :question_types,  only: [:index]
  get 'select_question_type', to: "question_types#select"

  root to: "surveys#index"






end
