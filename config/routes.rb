Curso::Application.routes.draw do

  resources :users do
    member do
      get :profile
    end
  end

  resources :books do
    
    member do
      patch :read
    end
    
    resources :comments do
    end

  end

  resources :comments

  resources :session do
    delete :logout
  end

  root 'books#index'
  
end
