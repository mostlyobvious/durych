Rails.application.routes.draw do
  get "cashflows/show"
  post "cashflows/update"
  get "cashflows/table"

  resources :responses

  root "cashflows#show"
end
