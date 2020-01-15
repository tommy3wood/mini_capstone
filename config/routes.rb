Rails.application.routes.draw do
  namespace :api do
    get '/all_products' => 'products#all_products'
    get '/budget' => 'products#budget_products'
    get '/high_end' => 'products#high_end_products'
    get '/lifestyle' => 'products#lifestyle_products'
    get '/basketball' => 'products#basketball_products'
  end
end
