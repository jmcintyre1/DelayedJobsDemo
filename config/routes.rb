Rails.application.routes.draw do
  resources :job_items
  get '/talk' => 'job_items#talk'

  resources :delayed_jobs, :except => [:new, :create, :update, :edit] do
    member do
      post :queue
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "delayed_jobs#index"
end
