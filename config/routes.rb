Rails.application.routes.draw do
  root 'welcome#index'

  resources :tickets do
    collection do
      match 'search' => 'tickets#index', via: [:get], as: :search
    end
  end

  resources :users do
    collection do
      match 'search' => 'users#index', via: [:get], as: :search
    end
  end

  resources :organizations do
    collection do
      match 'search' => 'organizations#index', via: [:get], as: :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
