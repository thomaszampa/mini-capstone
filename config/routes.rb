Rails.application.routes.draw do
  namespace :api do
    get "/product_one_url" => "products#product_one_method"
    get "/product_two_url" => "products#product_two_method"
    get "/product_three_url" => "products#product_three_method"
    get "/all_products_url" => "products#all_products_method"
  end
end
