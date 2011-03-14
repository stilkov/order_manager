OrderManager::Application.routes.draw do
  resources :orders
  resources :cancellations
  match '/orders/:id' => 'orders#cancel', :via => :post
end
