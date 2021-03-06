Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope '/api' do
    root 'users#current'
    get 'current_user' => 'users#current'
    resources :users do
      resources :gotos
    end
  end

  get '*path' => 'home#static_index'
end
