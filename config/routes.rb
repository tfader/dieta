Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user_calendars/index'
  root 'user_calendars#index'

  resources :user_calendars do
    resources :user_meals
  end

  resources :meal_types do
    get :autocomplete_meal_type, on: :collection
  end

  resources :meal_items do
    get :autocomplete_meal_item, on: :collection
  end

end
