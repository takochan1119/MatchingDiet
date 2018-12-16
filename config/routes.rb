Rails.application.routes.draw do
  # devise_for :users
  devise_for :teachers, controllers: {
  sessions:      'teachers/sessions',
  passwords:     'teachers/passwords',
  registrations: 'teachers/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root "home#top"
  get "/" =>'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :comments , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  
  resources :users, :only => [:show, :index, :edit, :update]
  resources :teachers, :only => [:show, :index, :edit, :update]
end
