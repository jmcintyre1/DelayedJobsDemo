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

  root "delayed_jobs#index"
end