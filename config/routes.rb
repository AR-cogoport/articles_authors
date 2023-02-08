Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/articles", to: "articles#index"
  post "/articles", to: "articles#add"
  get "/users" , to: "users#cred_show"
  post "/users" , to: "users#credentials"
  # get "/users/check", to: "users#check_cred_show"
  post "/users/check", to: "users#check_cred"
  put "/users/update_password", to: "users#update_pass"
  delete "/users/:id", to: "users#del_user"
  # put "/articles/:id", to: "articles#update_article"
  
  # get "/articles/category/:category", to: "articles#find_by_cat"
  # get "/articles/author/:author", to: "articles#find_by_auth"
  # get "/articles/title/:part_title", to: "articles#find_by_partial_title"
end
