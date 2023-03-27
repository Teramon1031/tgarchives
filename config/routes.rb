Rails.application.routes.draw do
  get "admin/login" => "admin#login"
  get "admin/signup" => "admin#signup"
  post "admin/signupPost" => "admin#signupPost"
  post "admin/loginPost" => "admin#loginPost"
  post "admin/logoutPost"=>"admin#logoutPost"
  # get "admin/list" => "admin#list"
  get "admin/new" => "admin#new"
  post "admin/create" => "admin#create"
  post "admin/update/:year/:num" => "admin#update"
  get "admin/edit/:year/:num" => "admin#edit"
  get "/" => "home#top"
  get "/:year/:num" => "team_page#each"
end
