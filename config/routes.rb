Rails.application.routes.draw do



  # get 'users/show' 
  root 'post_images#index'
  devise_for :users


#deviseを使用する際にURLとしてusersを含むことを示しています。
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_images, only: [:new, :create, :index, :show]
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :post_comments, only: [:create, :destroy]
  end

  resources :post_images, only: [:new, :create, :index, :show] do
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]
  end

  # resources :users, only: [:show]
  resources :users, only: [:show, :edit, :update]



end
