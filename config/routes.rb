Rails.application.routes.draw do

  
root to: 'metrics#index'
  resources :metrics, only: [:index, :show] do
    resources :values, only: [:new, :create, :edit, :update]
  end
end
