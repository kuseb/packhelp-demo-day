Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :offers, only: [:index, :show, :create]
    post '/offers/:id/accept', to: 'offers#accept'
    post '/offers/:id/reject', to: 'offers#reject'
  end
end
