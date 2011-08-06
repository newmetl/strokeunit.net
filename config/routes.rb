StrokeUnitNet::Application.routes.draw do

  devise_for :users
  
  devise_for :user do
    get "sign_up", :to => "devise/sessions#create"
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/session#destroy"
  end

  root :to => "application#index"
  match 'admin' => 'application#login'
  
  resources :home_items, :only => [ :new, :create, :edit, :update ]
  resources :home_items, :only => [ :destroy ], :controller => "stream_items"
  match 'home_items' => 'application#index'
  
  resources :live_items, :only => [ :new, :create, :edit, :update ]
  resources :live_items, :only => [ :destroy ], :controller => "stream_items"
  match 'live_items' => 'application#index'
  
  match "/images/uploads/*path" => "gridfs#serve"
  
end
