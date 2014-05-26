Spree::Core::Engine.routes.draw do
  
  namespace :admin do
    resources :reviews do
      member do
        get :approve
      end
    end
    resource :review_settings
  end

  resources :products do
    resources :reviews do
    end
  end
  
  get "/reviews/all_list", :to => "reviews#all_list", :as => :all_reviews
  
end
