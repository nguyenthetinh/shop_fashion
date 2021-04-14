Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :suppliers, path: 'suppliers', controllers: { sessions: "suppliers/sessions", registrations: 'suppliers/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  namespace :suppliers do
    resources :products do
      root "products#index"
      
    end
    # match "*path" => redirect("/suppliers"), via: :get
  end

end
