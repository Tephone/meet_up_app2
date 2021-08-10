Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :teachers, controller: {sessions: 'teachers/sessions'}
  devise_for :students, controller: {sessions: 'students/sessions', registrations: 'students/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
