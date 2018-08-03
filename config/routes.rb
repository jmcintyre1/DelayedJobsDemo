Rails.application.routes.draw do
  resources :delayed_jobs, :except => [:new, :create, :update, :edit] do
    member do
      post :run
    end
  end

  resources :job_items, :except => [:edit] do
    member do
      get :talk
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "delayed_jobs#index"
end