Rails.application.routes.draw do
  get "cashflows/show"
  post "cashflows/update"
  get "cashflows/table"

  root "cashflows#show"
end
