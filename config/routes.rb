Rails.application.routes.draw do
  get "cashflows/show"
  post "cashflows/update"
  get "cashflows/table"

  resources :responses
  resources :transactions, only: %i[index]

  root "cashflows#show"
end
