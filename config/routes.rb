ClaimAbleCodeChallenge::Application.routes.draw do
  resources :claims

  root :to => "claims#index"
end
