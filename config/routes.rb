Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/search' => 'pages#search', :as => 'search_page'
  resources :spells do
    collection do
      get :wizard
      get :bard
      get :sorcerer
      get :warlock
      get :paladin
    end
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end
