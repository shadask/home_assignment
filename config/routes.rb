Rails.application.routes.draw do
  resources :word_counters, only: [:index, :create]
  resources :word_statistics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
