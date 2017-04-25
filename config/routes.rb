Rails.application.routes.draw do
  resources :categories
  devise_for :users,:controllers => { :registrations => "registrations" }
  resources :products
    resource :cart, only: [:show] do
        post "add", path: "add/:id",on: :member
        get :checkout
    end
     resource :results, only: [:index] do
        get :index
    end
    resources :comments
    resource :home, only: [:index] do
        get :index
    end
    resources :orders, only:[:show,:index,:create] do
        post :custom, on: :collection
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'results/index'
    get 'comments/index'
    root 'home#index'
end
