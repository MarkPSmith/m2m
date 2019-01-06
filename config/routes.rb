Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :foos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
