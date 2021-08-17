Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_scope :admin do
    post 'admins/login_as_teachers', to: 'admins/sessions#login_as_teachers', as: :admin_login_as_teachers
  end
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions' }
  devise_scope :teacher do
    get 'teachers/edit', to: 'teachers/registrations#edit', as: :edit_teacher_registration
    put 'teachers/(.:format)', to: 'teachers/registrations#update', as: :teacher_registration
  end
  root 'tops#show'
  resource :top, only: %i[show]
  resource :admin, only: %i[show]
  resources :students, only: %i[index show] do
    collection do
      get :home
    end
  end
  resources :teachers, except: %i[edit update] do
    collection do
      get :home
    end
  end
  resources :lessons
  resources :lesson_reservations, only: %i[create destroy]
  resources :purchase_tickets, only: %i[new create]
  resources :reviews
  resource :reservation_rate_for_teacher, only: [:show]
  resource :reservation_rate_for_time, only: [:show]
end
