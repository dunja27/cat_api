Rails.application.routes.draw do
  resources :cats do
    resources :toys, only: %i[index create]
  end
  
  resources :toys, only: %i[show update destroy]
end

