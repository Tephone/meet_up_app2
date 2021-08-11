Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :teachers, controllers: {sessions: 'teachers/sessions'}
  devise_for :students, controllers: {sessions: 'students/sessions', registrations: 'students/registrations'}
  root 'tops#show'
  resource :top, only: %i[show]
  resource :admin, only: %i[show]
  resources :students, only: %i[index show] do
    collection do
      get :home
    end
  end
  resources :teachers do
    collection do
      get :home
    end
  end
  resources :lessons, only: %i[new create]
  resources :lesson_reservations, only: %i[create destroy]
  resources :purchase_tickets, only: %i[new create]
end
