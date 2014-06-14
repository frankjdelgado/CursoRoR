Curso::Application.routes.draw do

  resources :users do
    member do
      get :profile
    end
  end

  resources :books do
    
    resources :comments do
    end
  end

  resources :comments

  root 'books#index'
  
end
